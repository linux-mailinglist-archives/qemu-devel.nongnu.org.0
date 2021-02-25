Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0599032518D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 15:35:16 +0100 (CET)
Received: from localhost ([::1]:42532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFHjX-0006XF-1O
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 09:35:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFHfw-0004AB-Fv
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:31:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58425)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFHfs-0004dU-G5
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:31:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614263487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3W/06pY81fn8u7jBRiVM0mWP9ZVTlfJqReutwasZ5E8=;
 b=ZVidDpjc47o/1q3Z7pC/FUDOv6mqSY6ySX8AnO7iSC4qNyU+5pgdp6bPZbCJKQaqNhoZgF
 DMBDNIFT3B0US4RfaUF/Dr8m3XfOuDi8vH9hQ7zl/9X3Bqb/EcYsnQZqUPaM5iRke85SQj
 bluHclXHtuiUL3LsnX6bbNv2ysB40kE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-bI4GcWMaN4a11-sSaOW0oQ-1; Thu, 25 Feb 2021 09:31:25 -0500
X-MC-Unique: bI4GcWMaN4a11-sSaOW0oQ-1
Received: by mail-ed1-f70.google.com with SMTP id m1so2782235edv.12
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 06:31:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3W/06pY81fn8u7jBRiVM0mWP9ZVTlfJqReutwasZ5E8=;
 b=fDhdAN4tc05iBi8I37GBllAdmld0dUKs4Try62K/WOaWrZvVbzjU1Z5DLVxA/a0oTW
 jU0DH6UANUJLEnAO4LUkMCRRJeY4Gw42i3VJAb1FDHK/qI3efMbEONI7kq777GG0PaVy
 +WkjOgdrXwY1otL/aZjl8TteYjX0rpnJLfDe2T9NcJMNNv6uOgtx5CcAx2XpuS3A5fGH
 eXrcx5Hdy95KBKGU2LETapAUdsH7NN7dlzAvqv7K7LOJGsALSryRN1kso2gxKt69xdRK
 T9VLt9BtkVyvQgk3gTRRmdmGiFD0VNcdU1w8BeTNKpGHqaUrCNP/7rWc49ITQKMlPe6g
 3SiQ==
X-Gm-Message-State: AOAM530NrN22ZLDdXXK43IgexiOywQ3dt0J6koi78sG57QkECxLEc2Ee
 CqXcMWrx20nEihzFhnAI4tPAeP0lS7p42HwGMR3wEXE5R82y7ETYVz5X7FBXs8Vi+dZ+Px4hW2V
 fHYMtE0lyVc7BU+k=
X-Received: by 2002:aa7:de8f:: with SMTP id j15mr3247373edv.268.1614263484720; 
 Thu, 25 Feb 2021 06:31:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPtL8V9fbaN7TaSxkOcZWmM/Iyd+5PwF48MsE1MHsl2M67i8hXexOeCWThVdb3fnW1fLK0Sg==
X-Received: by 2002:aa7:de8f:: with SMTP id j15mr3247351edv.268.1614263484517; 
 Thu, 25 Feb 2021 06:31:24 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r23sm3657660edp.34.2021.02.25.06.31.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 06:31:23 -0800 (PST)
Subject: Re: [PATCH 1/6] net: introduce qemu_receive_packet()
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20210224055401.492407-1-jasowang@redhat.com>
 <20210224055401.492407-2-jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <389864ac-b741-b2d9-5289-9b8a71ffbb4f@redhat.com>
Date: Thu, 25 Feb 2021 15:31:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224055401.492407-2-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: ppandit@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/21 6:53 AM, Jason Wang wrote:
> Some NIC supports loopback mode and this is done by calling
> nc->info->receive() directly which in fact suppresses the effort of
> reentrancy check that is done in qemu_net_queue_send().
> 
> Unfortunately we can use qemu_net_queue_send() here since for loop
> back there's no sender as peer, so this patch introduce a
> qemu_receive_packet() which is used for implementing loopback mode
> for a NIC with this check.
> 
> NIC that supports loopback mode will be converted to this helper.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  include/net/net.h   |  5 +++++
>  include/net/queue.h |  8 ++++++++
>  net/net.c           | 38 +++++++++++++++++++++++++++++++-------
>  net/queue.c         | 22 ++++++++++++++++++++++
>  4 files changed, 66 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


