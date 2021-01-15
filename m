Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D092F7380
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 08:06:25 +0100 (CET)
Received: from localhost ([::1]:42810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0JBg-0004Zo-Al
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 02:06:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l0J9r-0003ro-Ab
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 02:04:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l0J9p-00089W-HR
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 02:04:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610694264;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZJJ6hGo17+05ApQ3K/MjMrIh8dfZJJMfVYmYxxVHa44=;
 b=bl7O7NbOZfkflGGyVhCSoJ3ArXbI3J/1LQy8Ol40rRm7BGZl6eRIsphaovCPPwbRY4YuC8
 70KMGwsnDgL7LkBN0tnki7kheFUr8V/NCATWwecAe5E+Q6cbA0ylse/wRbfk1YbQzdWp+u
 i3gefPBrLYQrrS3tByn0dfSVP6wPbT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-qofva4ubPlaWvEHbeB12mA-1; Fri, 15 Jan 2021 02:04:19 -0500
X-MC-Unique: qofva4ubPlaWvEHbeB12mA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C38F48144E3;
 Fri, 15 Jan 2021 07:04:18 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-108.ams2.redhat.com [10.36.112.108])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E3DF51F0;
 Fri, 15 Jan 2021 07:04:14 +0000 (UTC)
Subject: Re: [PATCH 07/23] sdlaudio: replace legacy functions with modern ones
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <9315afe5-5958-c0b4-ea1e-14769511a9d5@t-online.de>
 <20210110100239.27588-7-vr_qemu@t-online.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d34c0592-289c-e7a9-07a4-9e9357e99fe0@redhat.com>
Date: Fri, 15 Jan 2021 08:04:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20210110100239.27588-7-vr_qemu@t-online.de>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.248,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.237, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>,
 =?UTF-8?B?Wm9sdMOhbiBLxZF2w6Fnw7M=?= <dirty.ice.hu@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/01/2021 11.02, Volker Rümelin wrote:
> With the modern audio functions it's possible to add new
> features like audio recording.
> 
> As a side effect this patch fixes a bug where SDL2 can't be used
> on Windows. This bug was reported on the qemu-devel mailing list at
> 
> https://lists.nongnu.org/archive/html/qemu-devel/2020-01/msg04043.html
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   audio/sdlaudio.c | 107 ++++++++++++++++++++++-------------------------
>   1 file changed, 50 insertions(+), 57 deletions(-)

Looks fine to me.

Reviewed-by: Thomas Huth <thuth@redhat.com>


