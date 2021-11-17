Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0EB454EC2
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 21:49:50 +0100 (CET)
Received: from localhost ([::1]:35656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnRsK-0007z4-J2
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 15:49:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnRqG-0006Uo-I5
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 15:47:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48982)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mnRqE-0000BP-Mf
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 15:47:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637182057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8xPK7inuc0m+8E4ZawGGLzBZSifgSSRfvoqvOLY4cCo=;
 b=Czd1UsT1VbfqRIHbaEo1gWcv0QpTfs2CteloVZxs0ws9rHE+9d1XznLzNRi8T+semlaEAL
 zKqyqWUedQZPNit8WDHyoWCW2MyIHqjZNnen4Pb04NsZvfS3DU5atmYPaA2xIIKGB7TYna
 qggr6ZB8rI+xqqh+VBL5nhimheISpUU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-feRLTgZaP5CWGdgwq6pG3Q-1; Wed, 17 Nov 2021 15:47:36 -0500
X-MC-Unique: feRLTgZaP5CWGdgwq6pG3Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 201-20020a1c04d2000000b003335bf8075fso1627904wme.0
 for <qemu-devel@nongnu.org>; Wed, 17 Nov 2021 12:47:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8xPK7inuc0m+8E4ZawGGLzBZSifgSSRfvoqvOLY4cCo=;
 b=vduWfnn4yjg0pnn1MnLU+VFcVKW1UsKRTHAPAkKxOKxkGPzq72KBvBqrhdLNN92zdp
 K6h7oHetyA9GWnjOVF2XMx8caAUl8VzWLft+dgiNRU1ZqcukXeGuPeZGtOA8/XHzN4Xb
 Ooz7vD2LSz91LRsEly8CWbTW/fd79zbCjaFMiW8VEbjsypROgt81OoigTfBZNdSSymEN
 purX+Pt0JUu+/ed4IKqxHUn6QJDlXqTybVsiSFKjLJdLZjjTJ7SxY/cg/nczmEfajEIO
 auWovNHHhP5Sqx7PyI0RFyvOZPRnSmevrLlNNeEUwcLuG20Lgw009WU8lUoTz51eNuc7
 abew==
X-Gm-Message-State: AOAM533nTh5LUKDu1pfKn6llsntu5Ojbv8tAfi7+XMI9gqLS3+7PCbAB
 lDihZmaYk3dqToofwpRkUvj9/csR+GiFv2+St7jHDcUg9mAZLSvbZq6hR4KjorbSnI8pqJ1SAng
 rU92MOJhhjDIoB4Y=
X-Received: by 2002:a05:6000:1289:: with SMTP id
 f9mr25057110wrx.329.1637182055321; 
 Wed, 17 Nov 2021 12:47:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxv94VPq+CobwJbK10kWE6PJLwfvewfrNMy5Ukb8e81/RIycHexNP5rqE47fcc6WcC0im9iXQ==
X-Received: by 2002:a05:6000:1289:: with SMTP id
 f9mr25057089wrx.329.1637182055156; 
 Wed, 17 Nov 2021 12:47:35 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id u6sm130261wmc.29.2021.11.17.12.47.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Nov 2021 12:47:34 -0800 (PST)
Message-ID: <ec5dbaeb-beee-feda-9441-92a39075e05a@redhat.com>
Date: Wed, 17 Nov 2021 21:47:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] Fix typo in comment.
To: lagarcia@linux.ibm.com, qemu-trivial@nongnu.org
References: <c30019abaca0ca1a9f636671a8a2552a0bb17a71.1637180729.git.lagarcia@br.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <c30019abaca0ca1a9f636671a8a2552a0bb17a71.1637180729.git.lagarcia@br.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.009, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Garcia <lagarcia@br.ibm.com>, qemu-devel@nongnu.org,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Leonardo,

On 11/17/21 21:26, lagarcia@linux.ibm.com wrote:
> From: Leonardo Garcia <lagarcia@br.ibm.com>
> 
> Signed-off-by: Leonardo Garcia <lagarcia@br.ibm.com>
> Reviewed-by: Laurent Vivier <laurent@vivier.eu>
> ---
>  hw/virtio/vhost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Better if you prefix the patch subject with "hw/virtio/vhost: ",
anyway:
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Thanks,

Phil.


