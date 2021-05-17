Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAD5383ACE
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 19:12:03 +0200 (CEST)
Received: from localhost ([::1]:47522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ligmf-0000Cc-N8
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 13:12:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ligCl-00007W-BR
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:34:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1ligCi-0007Rt-EM
 for qemu-devel@nongnu.org; Mon, 17 May 2021 12:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621269291;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Mtj91ZXKgEmKUXNEPAFhV4yABRaem1GuOu2+keZSFmA=;
 b=HQ4O7UW8/m7Iu4I60M13fKjciNFTwuco7Rd2FQ7CAkXcKDXnaA6CVPYYnuWtTnTz1W/upK
 Jh8Kh6deQYYZRBo9EFiGw+NCrVo43XHyt7a5xe1W5X9mD4VEcyvyjZ1Kf1I5mMWCfR1zaB
 pge4SuOVbGQR8FxEag9ktjYZ34WpcqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-LnuZ4-o-P_OmIzrtIK5cUw-1; Mon, 17 May 2021 12:34:49 -0400
X-MC-Unique: LnuZ4-o-P_OmIzrtIK5cUw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20ADC802B4F
 for <qemu-devel@nongnu.org>; Mon, 17 May 2021 16:34:49 +0000 (UTC)
Received: from [10.10.117.64] (ovpn-117-64.rdu2.redhat.com [10.10.117.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2667C60C9B;
 Mon, 17 May 2021 16:34:45 +0000 (UTC)
Subject: Re: [PATCH v3 3/9] qapi: start building an 'if' predicate tree
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20210429134032.1125111-1-marcandre.lureau@redhat.com>
 <20210429134032.1125111-4-marcandre.lureau@redhat.com>
 <5d0a776e-e597-6996-c407-cd2d91883eac@redhat.com>
 <CAMxuvazaW17gNHtMD=agbtP04ru6UOVQWcG34tG0i8c7NecCpg@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <ad2bcfaf-f03e-17ea-33f1-d77dc120b77c@redhat.com>
Date: Mon, 17 May 2021 12:34:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAMxuvazaW17gNHtMD=agbtP04ru6UOVQWcG34tG0i8c7NecCpg@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Armbruster,
 Markus" <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/17/21 7:18 AM, Marc-André Lureau wrote:
> That's also what I thought (it was in my commit message comments). 

I did read them, I promise :)

> Repeating myself, I'd defer this, there is no urge to make the code more 
> complex yet. It can easily be done in a following iteration.

I think I can accept this, as long as we don't create a lot of work for 
ourselves splitting it back out later.

I think it'll be up to Markus, ultimately.

--js


