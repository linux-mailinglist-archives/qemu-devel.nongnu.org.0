Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5828853CA48
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 14:58:51 +0200 (CEST)
Received: from localhost ([::1]:55402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nx6t7-00068e-Sr
	for lists+qemu-devel@lfdr.de; Fri, 03 Jun 2022 08:58:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx6r2-000514-30
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 08:56:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nx6qx-0005ZG-C5
 for qemu-devel@nongnu.org; Fri, 03 Jun 2022 08:56:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654260994;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mAMggLXTiSG29FOpZLoHGLPvinG60BkItCqLLzsknCo=;
 b=NpN4h6irmbCYSU8MhTyHuveY15PJGiF9g3WGjcEQobdfSIseINZP12ySAYm348ir1QaRrM
 0oEa3JKHKWlyYwXf4x1CrjIZ5YWvVRS2NTcgPNTLThzo3fDtJG5gFQpyf+ddISI87GD9hB
 Hm4IhLDSpUMllafvDDwysBif8dpnYP8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-626-h8caPX9FNpmnvVUSMda9Fw-1; Fri, 03 Jun 2022 08:56:33 -0400
X-MC-Unique: h8caPX9FNpmnvVUSMda9Fw-1
Received: by mail-wm1-f72.google.com with SMTP id
 o3-20020a05600c510300b0039743540ac7so3551202wms.5
 for <qemu-devel@nongnu.org>; Fri, 03 Jun 2022 05:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mAMggLXTiSG29FOpZLoHGLPvinG60BkItCqLLzsknCo=;
 b=ZGcXQj7owMmsvZj4WPWuM7XEsqH9gaPo19P/rplUgPN1ZzR/Y2f/5xD3sDGSdN2hQK
 PcaLvI+30SrZ/UaEVFbW348x8sj63vb8oTsLp0C+LZE7Y4JiUae5sdXibogXmYlD+oL2
 EoAXeCHayDY1GMl0/1DeYo9Hw+GJaiv9ofZyT3QY2OEP9l59TRr+wVHeHWXoMl6nJE4x
 57hfc3W4MxcFa02vAVgaIp8RvW7G4UNygYo5o9SMJwfRzJkaYKU3suTlVMYo3Gqnojwr
 V+cM/3xSCl3WgSRTsfFmTtn8bJ7HOHwZsnsutxuBQYIxl5srdyGgtQIRDofN41pqt+Nm
 l+Qw==
X-Gm-Message-State: AOAM533EForGm/xDE+nFOhT4kD24OdFvNje79R9ksrTDufmq1S/16IU9
 dp3ZXTYDnoSO7T39Op+PyBERoYVrPPQfR0VFUz6vjDg4GlhW7Z8xI3DY6hbzEWeP2u1XmLBk3g/
 EbRS5xqkdp7UGdoc=
X-Received: by 2002:a5d:6651:0:b0:210:3e1c:1343 with SMTP id
 f17-20020a5d6651000000b002103e1c1343mr8111995wrw.137.1654260992273; 
 Fri, 03 Jun 2022 05:56:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxriKO6Ci+WTPhWV9C6ZuO6O3b2T7lbmYb7XK550ATNev/D7raoyD7KE3QNBCg4mdQnygFDEA==
X-Received: by 2002:a5d:6651:0:b0:210:3e1c:1343 with SMTP id
 f17-20020a5d6651000000b002103e1c1343mr8111976wrw.137.1654260992070; 
 Fri, 03 Jun 2022 05:56:32 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-176-98.web.vodafone.de.
 [109.43.176.98]) by smtp.gmail.com with ESMTPSA id
 d7-20020a5d4f87000000b0020ffa2799f4sm7075948wru.73.2022.06.03.05.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Jun 2022 05:56:31 -0700 (PDT)
Message-ID: <39ab44eb-5115-6af3-37e2-ca79973dad2b@redhat.com>
Date: Fri, 3 Jun 2022 14:56:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Debian MinGW cross compilation (was: Re: [PULL 2/3] qga-win32: Add
 support for NVME but type)
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: Konstantin Kostiuk <kkostiuk@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20220523194111.827805-3-kkostiuk@redhat.com>
 <541f46cf-fc45-f7bb-e121-2aad216e11d5@linaro.org>
 <CAPMcbCq7fzubG4ej7p164vwQkCMChjWBubx27R=kVxukWDhuBg@mail.gmail.com>
 <CAPMcbCqeQ_7YuJg+eS9Qqtq9ptRb57_wfT=jGOuHYtx64M5azA@mail.gmail.com>
 <CAMxuvawvaZBp0sxV-jwQuDwxahuFjN10BDcBcgOn88XpN87RPA@mail.gmail.com>
 <f4f5afc8-0b01-e134-bb83-b3d0ded0439a@redhat.com>
 <CAPMcbCr8_zgYcMQ9Q0GSQL-TgvOGY-q16sMoVNxBpvwG4JDEng@mail.gmail.com>
 <449f117b-32c9-e066-55dd-1208313bce3f@redhat.com>
 <CAPMcbCpgyNnggdMTY9K3=nv_BBF8Fbsp_MoAQ6ubeUEA5-aL=A@mail.gmail.com>
 <59b8bdee-ef2f-83b4-fbc7-4283cb964c33@redhat.com>
 <Yozfv2k3dnPy4hEJ@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <Yozfv2k3dnPy4hEJ@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 24/05/2022 15.38, Daniel P. Berrangé wrote:
> On Tue, May 24, 2022 at 03:28:37PM +0200, Thomas Huth wrote:
...
>>
>> Daniel, do you remember whether we supported Debian for MinGW
>> cross-compilation in the past?
> 
> At one time we used to have Debian with the 3rd party 'mxe' builds
> of mingw added. It broke periodically and we deleted it in the
> end. It wasn't adding value over what Fedora mingw could provide
> as both more or less tracked the same versions of software in
> their mingw packages.

I wonder whether anybody still tried to compile with this mxe repo in recent 
times...?
Should we adjust our support statement and just mention Fedora there? 
Otherwise we should maybe explicitly mention MXE there next to "Debian", 
too, so that people don't get the impression that QEMU can be compiled with 
a vanilla MinGW installation on Debian?

  Thomas


