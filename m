Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5419058A979
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 12:29:02 +0200 (CEST)
Received: from localhost ([::1]:51494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJuZh-0003gs-2k
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 06:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oJtpj-0000q1-SL
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:41:32 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:38866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oJtpi-0001sY-AB
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 05:41:31 -0400
Received: by mail-ej1-x62d.google.com with SMTP id k26so4055022ejx.5
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 02:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vvCH2N9HH/ttK+Z1k0XHHsmz+YboQ+eOAoQ12kszZSg=;
 b=nQ/ZA8XCNSGk0Jx4gMSee0kN23DOyj1L0wMWPT2Dg54fDxF7HSZ2/NQ6oTN/he4t9s
 VQ0igGfr5Pd9D2vc9HXGc55Mml4xc617NuJZade4K6Ytw+FXykhKtc8r464AwM7JayiT
 9/Jtb/wrNDHTdd6s3K2zrakGJJP0QVN8VQnkjCdJeKMJQx4xYawIhIhzkC8sY9lm4v5e
 i73i/SwlDQyBZwocEsf8+rjU6CWOuWBQFZdjy77tsd9uYnHG0YyEeL4rLeNRgzMQ4xe2
 mrP1deOMXWnU4aXURf5C80QSMyEps+mLr5UkH20oXgpYM9lMe/ErEDpjOJctJ4L8BgJI
 2+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vvCH2N9HH/ttK+Z1k0XHHsmz+YboQ+eOAoQ12kszZSg=;
 b=6ov8lsGEMAae5lKEXXlhotgd5v++21i79PZgDmz93aTrMiD8BLIq6WjjG4gqK1e29o
 8NUFpeK2/ETQEMZ129q5QvAIsZuMHqg/BaAApZqMITMg7rdLIzgGe5y5bi0AkYjAvI4G
 HDfILDLz5dQ2/T21Y6uxBSeuoS3CMYsm2y3XNhN3hPRIlaqR4jET78a5ag6weAaWIBcL
 cSfHnzCp0oPI0n8da60SJY2399WsJi38qZY4wHA5/XSuWNVgVJ7DWVMwtY9+76H0ktUF
 f4s53EWvpJBKQeW81x1D/ipAF8V0gqetNO0jLqqULAsHfvCQv4zR+qOb+nlnRSOeNNBs
 m9DQ==
X-Gm-Message-State: ACgBeo1Wn+oarjqYeqzEdxjcc6fHoS+MrGrrmjXQ6gyaX6HqfxP2FUBb
 AAm05nWcNlCeBjTgWeZT5Sl0yMYzOhgrTw==
X-Google-Smtp-Source: AA6agR6/SdPMXSNSY2hTDFU6c4RbDbNSyD47S9hXHMvNgiCHGK2kCyfDsDTO87y+9fdMIvn9mvTkqg==
X-Received: by 2002:a17:906:93f7:b0:730:da74:3454 with SMTP id
 yl23-20020a17090693f700b00730da743454mr3778112ejb.331.1659692488870; 
 Fri, 05 Aug 2022 02:41:28 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 w11-20020a056402128b00b0043bd2a79311sm1801320edv.37.2022.08.05.02.41.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 02:41:28 -0700 (PDT)
Message-ID: <837dc213-70cf-f677-2f22-fa731031ee77@redhat.com>
Date: Fri, 5 Aug 2022 11:41:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] virtio-scsi: fix race in virtio_scsi_dataplane_start()
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, sgarzare@redhat.com, kwolf@redhat.com,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, Fam Zheng
 <fam@euphon.net>, Qing Wang <qinwang@redhat.com>
References: <20220803162824.948023-1-stefanha@redhat.com>
 <20220805030329-mutt-send-email-mst@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220805030329-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 8/5/22 09:04, Michael S. Tsirkin wrote:
>>
>> Buglink:https://bugzilla.redhat.com/show_bug.cgi?id=2099541
>> Reported-by: Qing Wang<qinwang@redhat.com>
>> Signed-off-by: Stefan Hajnoczi<stefanha@redhat.com>
> A scsi thing that tree seems more appropriate.
> 
> Reviewed-by: Michael S. Tsirkin<mst@redhat.com>
> 
> 
> 

Since the same thing has to be done in virtio-blk, any of the 
block/misc/virtio tree will do.

Paolo

