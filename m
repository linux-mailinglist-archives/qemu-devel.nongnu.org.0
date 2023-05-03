Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 413AE6F5CE7
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 19:19:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puG8K-0003W7-R4; Wed, 03 May 2023 13:19:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puG8F-0003Re-66
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:19:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1puG83-0003tN-U0
 for qemu-devel@nongnu.org; Wed, 03 May 2023 13:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683134339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fphXzwhs7pSTOqa+5xPNLSnrwd39TLSdaiyQVlcItcA=;
 b=MtUnEn+xrBg2qxRvuh7HI/6FjvoFyJ2Gt0WVRoiljcVlkEwcYFs6CfrZ4mtYKWyqqqxieJ
 hH8O4fRDLB3pMEl80BC7JxltGQIKhCTTV3lkTrD8J0TeI1q2tCPozZGuyJqiuA/7FRbF4v
 61ydJDBjVMWFOU5oyvksMLroFUN+Ew8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-128-4OppeQ92NrOoNEuD6kEPxA-1; Wed, 03 May 2023 13:18:58 -0400
X-MC-Unique: 4OppeQ92NrOoNEuD6kEPxA-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-50bcbb5724aso3075767a12.1
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 10:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683134337; x=1685726337;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fphXzwhs7pSTOqa+5xPNLSnrwd39TLSdaiyQVlcItcA=;
 b=df/hUhh4hb8D1/caInrod4Y+YGbZTvIKkdnOtNrAE5NJxq2werESenLss1/iu9acvG
 MKEnzC8TBS95y1w2sC0MBMaBDxtGFGKI1TczNqSR5m/mMnm+d8vrSFNO/GmImz+07duu
 Izv8ZO4jri8T85N9dtHAue+GVbrACa59oJi1ejLlqDuD/zr5T9dZeg/bny3Y0cA/2piQ
 xlP3LFobmvukZ6VjUJD6oF9a3YRf4eWPoZgFYa0JpL8rana/VwLU+uu6JjrvmBx19VCt
 22eqdqu+pFYDwZHZZpms11cdt2Tn8J6JH8dci0+vbL5I14o5vG0S+3EC3Le6BZ/jLi6k
 /ZIQ==
X-Gm-Message-State: AC+VfDzP+/NEKp/MZV3CEaxmbMLb5KcUos0YWNo7YEpvhP4EGPZwtpmA
 RIMLqDa6B66gMYr9O0Z+eOUFDfdAqY+oLaYYtFDGh0DqL++YlmXCyWioQL4EKc25oRbSTuC6Z2S
 8sy+YKKz1IT6dxvU=
X-Received: by 2002:aa7:c743:0:b0:50b:ca1b:adeb with SMTP id
 c3-20020aa7c743000000b0050bca1badebmr7618357eds.0.1683134336963; 
 Wed, 03 May 2023 10:18:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4aNyKSamB5tkSHgFMRzngoR5UWpfpVeiNyPg2dHnKXrYl6HlQfwPptQdygUXp95cMJuUU+UQ==
X-Received: by 2002:aa7:c743:0:b0:50b:ca1b:adeb with SMTP id
 c3-20020aa7c743000000b0050bca1badebmr7618307eds.0.1683134336640; 
 Wed, 03 May 2023 10:18:56 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 i10-20020a05640200ca00b0050bd9d3ddf3sm897974edu.42.2023.05.03.10.18.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 10:18:56 -0700 (PDT)
Message-ID: <0f247f08-c025-9574-940b-668d1203a73b@redhat.com>
Date: Wed, 3 May 2023 19:18:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 14/22] hw/loongarch: add VIRTIO as a dependency for
 LOONGARCH_VIRT
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, Andrew Jeffery
 <andrew@aj.id.au>, qemu-s390x@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Beraldo Leal <bleal@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Radoslaw Biernacki
 <rad@semihalf.com>, Aurelien Jarno <aurelien@aurel32.net>,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Song Gao <gaosong@loongson.cn>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-15-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20230503091244.1450613-15-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -65
X-Spam_score: -6.6
X-Spam_bar: ------
X-Spam_report: (-6.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.28, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/3/23 11:12, Alex Bennée wrote:
> These are needed for board creation so fail under "make check" with a
> --without-default-devices build.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>

Also not needed:

bus: main-system-bus
   type System
   dev: platform-bus-device, id "platform-bus-device"
   dev: acpi-ged, id ""
   dev: ls7a_rtc, id ""
   dev: unimplemented-device, id ""
   dev: serial-mm, id ""
   dev: gpex-pcihost, id ""
     bus: pcie.0
       type PCIE
       dev: gpex-root, id ""
   dev: loongarch_pch_msi, id ""
   dev: loongarch_pch_pic, id ""
   dev: loongarch.extioi, id ""
   dev: loongarch_ipi, id ""
   dev: fw_cfg_mem, id ""


Paolo


