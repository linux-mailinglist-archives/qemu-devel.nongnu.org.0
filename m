Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA5F06F5482
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 11:21:32 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu8fc-00045k-DW; Wed, 03 May 2023 05:21:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pu8fX-00040l-Kb
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:21:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pu8fV-0005p3-BM
 for qemu-devel@nongnu.org; Wed, 03 May 2023 05:21:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683105655;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=omQ4R2QX/2d2JFlSuLnjEbi0u/9zZgwflkKF/NW9+Nc=;
 b=CJb/fqIQqyV05Af4AD3Vj80y5jZHeDYqltAedAQW6WfAVN6QXMqb5Sg/BQPaEGo0idlvrV
 YA141MYm3vO+rZcGup/69HIcnG1lgf09X0a7fuYX3CaGPTbmo1vRQSgsf5HwULoWeHePMT
 ChFL09wFj0Y+ZE5Hpx0yM8Mvx/nvkjA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-MKTs3c5gPs2oXpSn4q9CPA-1; Wed, 03 May 2023 05:20:54 -0400
X-MC-Unique: MKTs3c5gPs2oXpSn4q9CPA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3063394ae41so816036f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 02:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683105653; x=1685697653;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=omQ4R2QX/2d2JFlSuLnjEbi0u/9zZgwflkKF/NW9+Nc=;
 b=i8hSSvcNv1sEM/KUAAPAdw1HYrSRFrMm2LvhXGj8/ymh8I2tNld2LJ9vS2YPc/qR4Z
 dSRHuT1GTOY39dIQfbnf4I14h2K/S3ZF53enhRuoTy2Gs1X6MpFyFx9D53HzG132uQGN
 nA4pb+W2Ccq6K4+EEK3fSU86CoeWHXX7F4tltPHf19MgJWAI+clZzWlpzSiVdLA7Yxco
 tycTIrTjzJmPLDYBIl51Mp9e/jRR26usCYuN6+SXp9heafvnZomh6rPyYVhO/m+MFklB
 RUrvvpMONglL0C1kM365AutFNJrkOE73CRNNU4Hz+PteqmgtVx/TsWZg9TGdisZVFype
 t1jw==
X-Gm-Message-State: AC+VfDyICiaFyerja22ZFEGqwpT53W9BAOgV6jT3yUvlldv/GOGY4rUk
 us/zfoAjiHzFCV12Kmoa7IdhmbVwwSmN/r3zd8nhUoU71GYn9UCtJP5BBym6DOtDUbgfz2YDcir
 kSfHRs3PdQLD3D2vS1+vv9qg=
X-Received: by 2002:a5d:610e:0:b0:306:2a1a:d265 with SMTP id
 v14-20020a5d610e000000b003062a1ad265mr7298738wrt.58.1683105652987; 
 Wed, 03 May 2023 02:20:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4zTeEnRT/PiGyuki/UKDuUgbqGAjEtSCzEssKxstD7K5WqbWwvtf3sW4z6eIlRsrqk4riqPw==
X-Received: by 2002:a5d:610e:0:b0:306:2a1a:d265 with SMTP id
 v14-20020a5d610e000000b003062a1ad265mr7298700wrt.58.1683105652680; 
 Wed, 03 May 2023 02:20:52 -0700 (PDT)
Received: from [10.33.192.225] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 p6-20020adfcc86000000b0030644bdefd8sm794189wrj.52.2023.05.03.02.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 May 2023 02:20:52 -0700 (PDT)
Message-ID: <49cbd197-22f3-b0a4-62be-24f2b41475ab@redhat.com>
Date: Wed, 3 May 2023 11:20:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 02/22] tests/docker: bump the xtensa base to debian:11-slim
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Helge Deller <deller@gmx.de>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
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
 <20230503091244.1450613-3-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230503091244.1450613-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.422, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 03/05/2023 11.12, Alex Bennée wrote:
> Stretch is going out of support so things like security updates will
> fail. As the toolchain itself is binary it hopefully won't mind the
> underlying OS being updated.

Let's hope there won't be any problems with dynamic libraries...

Reviewed-by: Thomas Huth <thuth@redhat.com>


