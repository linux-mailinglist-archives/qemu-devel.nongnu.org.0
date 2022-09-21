Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FEB5BF61E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 08:12:43 +0200 (CEST)
Received: from localhost ([::1]:47084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oasyQ-00072w-VZ
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 02:12:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oassG-0002h1-L6
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 02:06:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oassC-0000Qk-2z
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 02:06:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663740374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DmgjovsVVmzL2K2iV6vhmmHtPfTLlWfdIDOI/Seoglw=;
 b=T5IAO3vB7E1+VgZW+JkBTSzHRZdPPKfQiIkHtvqe4iVLXwLaCUEy2yccV81tjBHTQ3142Y
 9kigUkXCTa2Ev8te4sIS1q9NxCWhNzftiFPkmmcSSNbPq/UdwQvoD5bYk16Rk/yqfST10Q
 WFuK/77L92hqCd2TS22TxFEIBz0zpXQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-124-VclXIQQlO4qFDEe7mfKknA-1; Wed, 21 Sep 2022 02:06:10 -0400
X-MC-Unique: VclXIQQlO4qFDEe7mfKknA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 55C32101A52A;
 Wed, 21 Sep 2022 06:06:10 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BDD72166B31;
 Wed, 21 Sep 2022 06:06:10 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 1823221E6900; Wed, 21 Sep 2022 08:06:07 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,  "Kim, Dongwon"
 <dongwon.kim@intel.com>,  Gerd Hoffmann <kraxel@redhat.com>,  Daniel
 =?utf-8?Q?P=2EBerrang=C3=A9?= <berrange@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, "Thomas Huth" <thuth@redhat.com>
Subject: Re: [PATCH v1 0/3] ui/gtk: Add a new parameter to assign
 connectors/monitors to Guests' windows
References: <20220917000731.465003-1-vivek.kasireddy@intel.com>
 <87a66uhytr.fsf@pond.sub.org>
 <IA0PR11MB718538F0549024D9D66C2410F84C9@IA0PR11MB7185.namprd11.prod.outlook.com>
Date: Wed, 21 Sep 2022 08:06:07 +0200
In-Reply-To: <IA0PR11MB718538F0549024D9D66C2410F84C9@IA0PR11MB7185.namprd11.prod.outlook.com>
 (Vivek Kasireddy's message of "Tue, 20 Sep 2022 20:48:15 +0000")
Message-ID: <87pmfpfei8.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Kasireddy, Vivek" <vivek.kasireddy@intel.com> writes:

> Hi Markus,
>
>> Any overlap with Dongwon Kim's "[PATCH v5 0/2] handling guest multiple
>> displays"?
>
> [Kasireddy, Vivek] Yes, there is some overlap but as I mentioned in the cover letter,
> this series is intended to replace Dongwon's series dealing with multiple displays.

I have no idea how I missed that part of your cover letter %-}

Dongwon Kim, would this series work for you?

>> Message-Id: <20220718233009.18780-1-dongwon.kim@intel.com>
>> https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg03212.html
>
> [Kasireddy, Vivek] We felt that using monitor numbers for display/VC assignment
> would be cumbersome for users. And, given that his series does not take into account
> monitor unplug/hotplug events, it's effectiveness would be limited compared to
> this one.

Thanks!


