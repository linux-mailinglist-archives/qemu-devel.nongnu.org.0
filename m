Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1819C6F562E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:29:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9jN-0006qv-78; Wed, 03 May 2023 06:29:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pu9jK-0006ki-VV
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:29:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pu9jI-00048n-Eh
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:29:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683109739;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TnPEnJrLHD8ltr2au6DXyolN9++eGsBREQwaNEUt+/M=;
 b=BqAH8L7t+VE/HhkpH+JfocUzCkfxMs14U9Ppm3vCXK/aJMom1XwdElffJ2v5LLy8yLNJtW
 79bY4VsCLinBLS2D0JawhhJS0UwmO7Ujw4aTkO+/W/Vegfi7NnOtGqyYFeRFJUBFbbZ4lp
 cy6RZkD4gwE3s7/75A3SYuWgpNPdMEY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-607-89gLkao-MqWbc6N1dW2PfA-1; Wed, 03 May 2023 06:28:58 -0400
X-MC-Unique: 89gLkao-MqWbc6N1dW2PfA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f168827701so17994425e9.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683109737; x=1685701737;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TnPEnJrLHD8ltr2au6DXyolN9++eGsBREQwaNEUt+/M=;
 b=GAaA73pOerVMotM3/6IJfOGFOIiUxFGsEc8xszBlruLYk24BbMsE/dd2Zwmlj/BbGR
 h67t/hUP3nOQCmG6kNlx/P9sGhwbDITYB6Xle+4A2AvdUMLacbEc/nBvUrbrScotHUHL
 mKUSUt1zHhUfr3lNXoUpaHmqQR2mIkDQDtYHIi4/i/yceVNilgetXvm0IvTH1x8eP07R
 xsNZbCczukNwOxko3v5nMv3vw3LK5oCGrXIW6h83/1qSkTw2wjEmwAxgsdxC1tiDHFWL
 2FRKLFN8iln6Rf6kl0vJnfw6F4o/nog+0WcmPOywMMMKPdOMOfT3hAAJQhIYVi1V9A2Y
 ltIQ==
X-Gm-Message-State: AC+VfDzY7NlrAZO+xLButTfWcBG5JoSyuASljF1FcLvKhBRV/vEIB8Cs
 cmKp9fVZN/ZdaV1SoEH4FHKlWm8MKsv4Nu9IOPBAFLpce4+YflWTWsf+9mTBHl4gMtCQACWM1M8
 obbIZGpyM62mPNOH9Y6SxXhoH9F0E
X-Received: by 2002:a05:6000:124b:b0:306:31b7:abe4 with SMTP id
 j11-20020a056000124b00b0030631b7abe4mr6030875wrx.14.1683109736872; 
 Wed, 03 May 2023 03:28:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4PYKyHaRaZXnhassASBWJMX6tT+7w9id+V8r6B704JQGO+8t6obhTbSSa7wK7ejL6KW/OExA==
X-Received: by 2002:a05:6000:124b:b0:306:31b7:abe4 with SMTP id
 j11-20020a056000124b00b0030631b7abe4mr6030851wrx.14.1683109736581; 
 Wed, 03 May 2023 03:28:56 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 e6-20020a5d4e86000000b003063d83a168sm2294491wru.26.2023.05.03.03.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 03:28:56 -0700 (PDT)
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
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH 02/22] tests/docker: bump the xtensa base to debian:11-slim
In-Reply-To: <20230503091244.1450613-3-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Wed, 3 May 2023 10:12:24 +0100")
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-3-alex.bennee@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 03 May 2023 12:28:55 +0200
Message-ID: <87cz3hso7s.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
> Stretch is going out of support so things like security updates will
> fail. As the toolchain itself is binary it hopefully won't mind the
> underlying OS being updated.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Reported-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


