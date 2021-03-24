Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8854347587
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 11:12:09 +0100 (CET)
Received: from localhost ([::1]:49074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP0Ui-0000lQ-JT
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 06:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lP0Sq-00005t-Vm
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 06:10:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lP0So-000597-Bw
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 06:10:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616580608;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f3cCXtzAWiTeIOPHV+SEYXwUII1FOBtYWS9tXYNNIrE=;
 b=QB6ktmy0ntDu4RNnb3OYMAoV4lFRoOwhTw2hKsX6dEWtFiPN01CkFS8KotKCla06sLfgxR
 A7wYvEdCxdpiePh73VO+wCrWokaWFjbdFHC7zFk43REZejmIUd/q/6mlom107gONMdZTb1
 1hK3zJYW5n73wxtP8a45dZBOVU/fMFI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-QRb-WFDGOq6E76kYyC2pkg-1; Wed, 24 Mar 2021 06:10:07 -0400
X-MC-Unique: QRb-WFDGOq6E76kYyC2pkg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5795C801817;
 Wed, 24 Mar 2021 10:10:05 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-47.ams2.redhat.com [10.36.112.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6BA1A10074FD;
 Wed, 24 Mar 2021 10:10:02 +0000 (UTC)
Subject: Re: Crashes with qemu-system-ppc64
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Greg Kurz <groug@kaod.org>
References: <1e4835a5-b785-5d0d-64d8-bb01afeea432@redhat.com>
 <20210324000056.349b6782@bahia.lan>
 <72f4839a-2a0d-f73b-bbde-8cad398dbbc9@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d4f10ff3-8a19-bbec-b998-b8d189801c4e@redhat.com>
Date: Wed, 24 Mar 2021 11:10:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <72f4839a-2a0d-f73b-bbde-8cad398dbbc9@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/03/2021 00.35, Philippe Mathieu-Daudé wrote:
[...]
> Hmmm does this assert() matches your comment?
> 
> -- >8 --
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index cefc5eaa0a9..41cbee77d14 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -1130,6 +1130,8 @@ Object *qdev_get_machine(void)
>   {
>       static Object *dev;
> 
> +    assert(phase_check(PHASE_MACHINE_CREATED));
> +
>       if (dev == NULL) {
>           dev = container_get(object_get_root(), "/machine");
>       }

Sounds like a good idea, but I think it should be sufficient to put it into 
the if-statement instead.
Could you send it as a proper patch?

  Thomas


