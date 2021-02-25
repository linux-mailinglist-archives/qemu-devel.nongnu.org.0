Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEF0325191
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 15:38:37 +0100 (CET)
Received: from localhost ([::1]:51006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFHmm-0001kg-1q
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 09:38:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFHie-00068O-U2
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:34:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFHic-0005iq-H9
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 09:34:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614263657;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RwINRQlaDanUzbjljNnLodn5Xt4IHlORa10HGsUTJzQ=;
 b=K8HiZowAmpHjRJcgzpDto9yXK5DWK/j+bEV9MfNxmVkT81sFDGPVP6lGL6FXRgYKkOsFUL
 EKFepXUMCwcvB8uYLMc2vG/12vyRAXTTc4NPR0XgMVD95MXEoS/cYcH9WR4EKYpnxzDmyW
 N4UeDJcqVGpFG852FWayKyl38EB2W7Y=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-B5rvHlXlMq-OVh6PejpjRg-1; Thu, 25 Feb 2021 09:34:15 -0500
X-MC-Unique: B5rvHlXlMq-OVh6PejpjRg-1
Received: by mail-ed1-f69.google.com with SMTP id w9so2756420edi.15
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 06:34:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RwINRQlaDanUzbjljNnLodn5Xt4IHlORa10HGsUTJzQ=;
 b=gLPacaRredmKMCWwjIvfkbFxj1htitFzlbhzs+lshM55oqqv6iaq89jk+TvwGZJwzK
 7rArOTtxGZBWT8dienfSjvxluaN5qZfxNzbVaVuxPZv0YiKQ3bztnjo8vPhnWJE5ozk+
 AHL7Et5Xj+z+qlg+7wixkkwxQSLOi0ntAoSDGm3DPtfGo8b4uFRBIpwYx5e+2Hm741PI
 S3WHf6cqx2qpxCbOm92SeB6kLa2H/PBZD+XxXANcSnSBCwcwmYy4m3bOG+4GsePA7Qhp
 b8/4a08Fp65NVHHYsrpv5PnVumrwGZ2klnpvB9oIUPkSPQIQb+DidzviE/OCNYpKJh4v
 04lA==
X-Gm-Message-State: AOAM531iJMu56w0jPqeu/GCpjU7YQxtCgGPRYXd9X9c2m+EG0gp8ZPXn
 E/yPAN7HJ18lAY+J4KomOEuqjvoeWKjtjo7Jry6YuWZZzEAz8XSkyzbACLO4EpjD1tK47D0B9E0
 WtXTkZsyXkbxZao4=
X-Received: by 2002:a17:906:5797:: with SMTP id
 k23mr2827889ejq.489.1614263654235; 
 Thu, 25 Feb 2021 06:34:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw2DIjkA68lnyjVHNoA0++FyH9XeGcMKJsDrgoZIec+pBprpflvjmKT+I63w0uuImom1BMAjQ==
X-Received: by 2002:a17:906:5797:: with SMTP id
 k23mr2827876ejq.489.1614263654093; 
 Thu, 25 Feb 2021 06:34:14 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r13sm25787edy.3.2021.02.25.06.34.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 06:34:13 -0800 (PST)
Subject: Re: [PATCH 2/6] e1000: switch to use qemu_receive_packet() for
 loopback
To: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
References: <20210224055401.492407-1-jasowang@redhat.com>
 <20210224055401.492407-3-jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7fb9d427-446e-5bab-bdf6-32ee384c100b@redhat.com>
Date: Thu, 25 Feb 2021 15:34:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224055401.492407-3-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
> This patch switches to use qemu_receive_packet() which can detect
> reentrancy and return early.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/net/e1000.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



