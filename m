Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1E53F5FDD
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 16:06:30 +0200 (CEST)
Received: from localhost ([::1]:49654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIX4P-0001nR-8n
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 10:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIX3S-0000bB-AO
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:05:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mIX3O-0000uF-Nc
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 10:05:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629813924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XtPzRkX7VzjHdFTxFOqyBDtuapCOFthlHVi5rmzks5Q=;
 b=X/t8+aBMUTOcX6ajzRJne17shH6eJQtVdcj3A+taxQxOSJog0v1wS5fCYQD/qYbli9WwzS
 iRVHazPEhJalrnjuHw6XbEceOrOhz/DsIM/R/H7nRss3f8m8bdfgjT31KQZiQ/7K+51bqf
 imHRAiePv1p4r391jyOZ5fHPxKNmsVw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-A4nybk84Pwm7nhE3xMzGRw-1; Tue, 24 Aug 2021 10:05:23 -0400
X-MC-Unique: A4nybk84Pwm7nhE3xMzGRw-1
Received: by mail-wm1-f70.google.com with SMTP id
 j33-20020a05600c1c21b02902e6828f7a20so1089345wms.7
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 07:05:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XtPzRkX7VzjHdFTxFOqyBDtuapCOFthlHVi5rmzks5Q=;
 b=JkvlKqjj2zMjvIW+BSVGZeE7vb8BdxpOt2j8zFIcOEH1Ock40J+ONtd2GZCujGel6j
 764sOAKFOkF2N4GPLLYsY7Z2u5TXUvjqZR9tKIDVk21ZHulCc+H0BYmjKpt6vGsgaA0r
 fokVlJMcQHZKGgXznbPuuhf9cPDp8PUJBbB4XffQTW8s+uaaIPEUFQpL3dJ12VxCX1gg
 93870FQHnBWf/QzMvejlnfjqbpyuDqvP6n9jOzElAzEf6IeUjahviSAyIm8t60WX5m/D
 sJ+Ho5fKlY6/5uwjoETyvhUtoo2cq3+KO+LWlsQ2pMyLYFXPAG0BURdfoLQSgh0UVf3e
 lStQ==
X-Gm-Message-State: AOAM532as1iwMMsP/JBesNH9dR9DRy1x8ms13GVxiOaPu/5YaQTOrGZe
 UnTAZK/++kBd7jPXzuRLFB89K+XI+l1fRRGCoWfcqJWXNXQ+IY01weFypmu40ELMJbL+8+7kUYI
 zqI/pa+CEjGKCWu5eKaUkyG42+V5zsxxKVLBCyJNZsf02Vy46qTIVenyoDVbIhUel
X-Received: by 2002:a5d:6085:: with SMTP id w5mr11085103wrt.104.1629813921657; 
 Tue, 24 Aug 2021 07:05:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzvHIlL3iAr1rxD6EUtvKPWOi/k3aGSM0F+5LvRHug/T1cSDkJhpzX9EKIzA25BOg5KjWQyBA==
X-Received: by 2002:a5d:6085:: with SMTP id w5mr11085070wrt.104.1629813921305; 
 Tue, 24 Aug 2021 07:05:21 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id r20sm10174060wrr.47.2021.08.24.07.05.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Aug 2021 07:05:20 -0700 (PDT)
Subject: Re: [PATCH] MAINTAINERS: Add myself as a reviewer for Device Fuzzing
To: Darren Kenny <darren.kenny@oracle.com>, qemu-devel@nongnu.org
References: <d9df51f9a474f544e773ad6fee4fcaa6bac2f645.1629813697.git.darren.kenny@oracle.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <57ccf909-c6c7-1eec-5ae6-956d4ea6e553@redhat.com>
Date: Tue, 24 Aug 2021 16:05:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d9df51f9a474f544e773ad6fee4fcaa6bac2f645.1629813697.git.darren.kenny@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.747,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.305, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/24/21 4:04 PM, Darren Kenny wrote:
> Should have done this much sooner given the amount of reviewing I'm
> already doing in this area.
> 
> Signed-off-by: Darren Kenny <darren.kenny@oracle.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)

:)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


