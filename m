Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 772C152131A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 13:05:21 +0200 (CEST)
Received: from localhost ([::1]:56072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noNg8-0006LH-J7
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 07:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1noNZO-0004IZ-Bj
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:58:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1noNZM-0008HB-MB
 for qemu-devel@nongnu.org; Tue, 10 May 2022 06:58:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652180299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=y57Xjn0JI8mMRQ1RCOFCXrYc5sGcq+ocThNC5NghPik=;
 b=AgOmm6hbndJ1OvTX7xC/7V3HzZsIpQcsrICS6dHOWwGM+aRp6SUkc7109lfCgHFv85MdHz
 VXWK1K6+qxm7RY873EX9pQtFlRolIhcMyLocwMDgc7CsJgd9aBEVhhKgdyq9cG+COajWWa
 xAkNcGFI21sx4XvKX3rvxjxLOWsaX0Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-_YFRk0E1OJeetaqPGfJMhw-1; Tue, 10 May 2022 06:58:16 -0400
X-MC-Unique: _YFRk0E1OJeetaqPGfJMhw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A5772949BBF;
 Tue, 10 May 2022 10:58:16 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.195.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D451EC27EB1;
 Tue, 10 May 2022 10:58:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2285118000A3; Tue, 10 May 2022 12:58:10 +0200 (CEST)
Date: Tue, 10 May 2022 12:58:10 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Dongwon Kim <dongwon.kim@intel.com>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, philmd@redhat.com, pbonzini@redhat.com,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH 1/3] ui/gtk: new param monitor to specify target monitor
 for launching QEMU
Message-ID: <20220510105810.erlgwqjtlauwf6pk@sirius.home.kraxel.org>
References: <20220428231304.19472-1-dongwon.kim@intel.com>
 <20220428231304.19472-2-dongwon.kim@intel.com>
 <YnDyodis9sdnyh3O@redhat.com>
 <20220509213105.GA180@dongwonk-MOBL.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220509213105.GA180@dongwonk-MOBL.amr.corp.intel.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, May 09, 2022 at 02:31:05PM -0700, Dongwon Kim wrote:
> Daniel,
> 
> I found a way to make the monitor arguments in array type (['uint32']).
> And I know how to retrieve monitor values from it but I could not find
> how to pass the monitor values when starting qemu. Like,
> 
> qemu-system-x86_64 ..... gtk,gl=on.....monitor=????
> 
> I tried several different things but it keeps getting error saying
> Invalid parameter type, expected 'array'.
> 
> Do you know how to pass this arg?

qemu accepts json for -display, that should work:

-display '{ "type": "gtk", "monitor": [ 1, 2 ] }'

Not sure whenever there is some way to specify arrays using
the -display gtk,$options style.

take care,
  Gerd


