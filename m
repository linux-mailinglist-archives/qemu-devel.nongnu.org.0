Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC09D6F5645
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:35:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9os-0007Ag-Cg; Wed, 03 May 2023 06:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pu9oq-0006xr-1a
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:34:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pu9on-0007Ig-9B
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:34:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683110080;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t6pPYq+XfrfjaqZsj/DmKkWD8+wh+UXYIc8fbVOja2w=;
 b=T/ogBJYWaZSRjg61+G3+RT9/Tu65LioxcGxrORYM6MqwWVKq10lPCKSd+7z+1TaqSb3nBS
 cmpxy76k218FUSmC5eIV6qUvcPQejI/jDvgsNZavJ3dOT1xO/CWZQ1rMUyJkMxS26J8BfF
 wz5Gq+IF+V7NQhTOYFnTjhIj04WPGO8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646--2L254FCOXOMKXIICVCHjA-1; Wed, 03 May 2023 06:34:39 -0400
X-MC-Unique: -2L254FCOXOMKXIICVCHjA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-306281812d6so1449594f8f.2
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:34:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683110078; x=1685702078;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t6pPYq+XfrfjaqZsj/DmKkWD8+wh+UXYIc8fbVOja2w=;
 b=R5bC1+B68XTXpZHTMGohmKqAjB9btCryz/HB2gM8rFqvDU5Gf5LqaUZOiMLIBjYma1
 5Yg4I8PKqevB2EOrF3O4DYVUhYVbDsKL51vh5lQmx5oRmMQ5ssuhHNDwahA43YGX1LS3
 ixPVUXBCVmzoJ2OIzoAgKBVLeC4irlGmkmY0JI8bs/hu91eNWc0ZgcQKe+KXrPHVnPcI
 LvEQwUtjkZpRTBqPXGYScsyRS6gDCVpOAVBEUKwlBJzeQTwIK40y9Ob53HFp36LGtxRi
 kJnldVmbEuGPJhNqPGl5LtB5WIGaPXBkrzXmlAb1CRYSY5/0OPePwKGsTkHSGnwwxPcg
 Q0fg==
X-Gm-Message-State: AC+VfDyoTkAN2ImDjCctTnWgAHmokZaBFWEraoS3rZgUTi9fq25r5oeZ
 COAw24xnJ3LxjRaWQf+Ynr0jCIIqJUKBoXd10ZaS9R6rgLH4X5XXJuWYusILO+uDmFxP9Uxeg8f
 /DgrmvMiMSrs3iqU=
X-Received: by 2002:a5d:6a8f:0:b0:306:3b62:d3be with SMTP id
 s15-20020a5d6a8f000000b003063b62d3bemr2755199wru.41.1683110078475; 
 Wed, 03 May 2023 03:34:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4t2PbBIR9svpe2DVF+23Cz9zwuc2MXilEYOKMeSQqiKBKR1MCRJqomSo5VvW3l8pIoFbROUA==
X-Received: by 2002:a5d:6a8f:0:b0:306:3b62:d3be with SMTP id
 s15-20020a5d6a8f000000b003063b62d3bemr2755183wru.41.1683110078197; 
 Wed, 03 May 2023 03:34:38 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 j18-20020a5d4492000000b0030632833e74sm5960204wrq.11.2023.05.03.03.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 03:34:37 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org,  Laurent Vivier <lvivier@redhat.com>,  Artyom
 Tarasenko <atar4qemu@gmail.com>,  "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>,  Wainer dos Santos Moschetta
 <wainersm@redhat.com>,  Thomas Huth <thuth@redhat.com>,  Leif Lindholm
 <quic_llindhol@quicinc.com>,  Paolo Bonzini <pbonzini@redhat.com>,  Gerd
 Hoffmann <kraxel@redhat.com>,  Helge Deller <deller@gmx.de>,  Xiaojuan
 Yang <yangxiaojuan@loongson.cn>,  Stefan Hajnoczi <stefanha@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Eduardo Habkost <eduardo@habkost.net>,  John
 Snow <jsnow@redhat.com>,  Yoshinori Sato <ysato@users.sourceforge.jp>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,  Ilya Leoshkevich
 <iii@linux.ibm.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,  Andrew Jeffery
 <andrew@aj.id.au>,  qemu-s390x@nongnu.org,  Richard Henderson
 <richard.henderson@linaro.org>,  qemu-arm@nongnu.org,  Bastian Koppelmann
 <kbastian@mail.uni-paderborn.de>,  Beraldo Leal <bleal@redhat.com>,  Max
 Filippov <jcmvbkbc@gmail.com>,  =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>,  Mark Cave-Ayland
 <mark.cave-ayland@ilande.co.uk>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,  Aurelien Jarno
 <aurelien@aurel32.net>,  David Hildenbrand <david@redhat.com>,  Markus
 Armbruster <armbru@redhat.com>,  Song Gao <gaosong@loongson.cn>,  Joel
 Stanley <joel@jms.id.au>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Fabiano Rosas
 <farosas@suse.de>
Subject: Re: [PATCH 20/22] gitlab: enable minimal device profoile for
 aarch64 --disable-tcg
In-Reply-To: <20230503091244.1450613-21-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Wed, 3 May 2023 10:12:42 +0100")
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-21-alex.bennee@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 03 May 2023 12:34:36 +0200
Message-ID: <87y1m5r9dv.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> As this is likely the most common configuration people will want once
> the --disable-tcg patches land.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Fabiano Rosas <farosas@suse.de>

s/profoile/profile/ on $subject

> ---
>  .gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml b/.gitl=
ab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
> index f8489dd3fc..374b0956c3 100644
> --- a/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
> +++ b/.gitlab-ci.d/custom-runners/ubuntu-22.04-aarch64.yml
> @@ -145,7 +145,7 @@ ubuntu-22.04-aarch64-notcg:
>   script:
>   - mkdir build
>   - cd build
> - - ../configure --disable-tcg
> + - ../configure --disable-tcg --with-devices-aarch64=3Dminimal
>     || { cat config.log meson-logs/meson-log.txt; exit 1; }
>   - make --output-sync -j`nproc --ignore=3D40`
>   - make --output-sync -j`nproc --ignore=3D40` check

I have no clue about what arm users want or not.

Later, Juan.


