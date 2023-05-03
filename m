Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26FEB6F5632
	for <lists+qemu-devel@lfdr.de>; Wed,  3 May 2023 12:31:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pu9kb-0000ik-5K; Wed, 03 May 2023 06:30:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pu9kY-0000hM-MZ
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:30:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pu9kW-0004nl-S5
 for qemu-devel@nongnu.org; Wed, 03 May 2023 06:30:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683109816;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=En9QoHUoC6dMPn6ozwvRZYLS0H/sOJprYNMiFk0oPoU=;
 b=P5rzX1Rqi7EeRAZ5++chMAAYjtzQLrKte/yVPEe/XweWZMLTuParPyjHJJzWh90GDTvq3I
 erW3hk/yNapwmPCGiRxsVgYn8rX6jVL/1maRE/Rq8OTO8XOjjK8j7jB+IHEXmYqJZmOYs5
 5LCNJLHCWjron9r0pwWJFio4bfHViUw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-578-ZS3PCLGqOpKB8i3BiILmNQ-1; Wed, 03 May 2023 06:30:15 -0400
X-MC-Unique: ZS3PCLGqOpKB8i3BiILmNQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-30643d4a430so171907f8f.0
 for <qemu-devel@nongnu.org>; Wed, 03 May 2023 03:30:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683109814; x=1685701814;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=En9QoHUoC6dMPn6ozwvRZYLS0H/sOJprYNMiFk0oPoU=;
 b=Ie9WP13FDUfo9gxxNKSW4XztCNoyum6kCo+TukA+i4KBVa5nss5XMcLjs7bMT5S0fT
 mUmjwzyVemfqCf+xst1NgEjKs1KbdhqOLtg4h2qsXaLSaYjfzMjiVFgQVo9Gvxg406KR
 fUsH8Xkmc1bTskfn2g2pJSrASXzkaLEWTTAO3kGGjJcFa9MqTHw49smzwpxOjBgcYSo2
 eQJfJtq5yuIkOyza+OJLUamTpduZN+TrLDDEJPPGX2OJEc3EdlRthVh//Qdmnv6iRuPv
 xp4V+Wn3rfE6PXbfzBIhjOMha7iduLU0zT9sK3FZk5WeTzu+uarGfGRgDplXt9B0dOaN
 JN7w==
X-Gm-Message-State: AC+VfDz7y0fAf7Wpq2nTPueVMVyzWHABfDlXQ93EE9BzRkBnmD7crrsz
 pNp0whfT4VkbJqzWr/9QrS2Tys6tPZhtyVBNZ15A5KY6YUAomI0YyjNQb0Z7hxLIZc8NKIqw/+F
 O00SUs2FtU9QZhvM=
X-Received: by 2002:a5d:58d0:0:b0:306:2701:5346 with SMTP id
 o16-20020a5d58d0000000b0030627015346mr7992109wrf.39.1683109813932; 
 Wed, 03 May 2023 03:30:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4AaMd4LSbgC9ij56OzGUAv2BGMhKaClvnxyAG6hKKfM2haq9EE1w8PBipUyNkUvHISwTgt8w==
X-Received: by 2002:a5d:58d0:0:b0:306:2701:5346 with SMTP id
 o16-20020a5d58d0000000b0030627015346mr7992077wrf.39.1683109813602; 
 Wed, 03 May 2023 03:30:13 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 z2-20020a5d4c82000000b003021288a56dsm32554642wrs.115.2023.05.03.03.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 03:30:13 -0700 (PDT)
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
Subject: Re: [PATCH 03/22] docs: document breakpoint and watchpoint support
In-Reply-To: <20230503091244.1450613-4-alex.bennee@linaro.org> ("Alex
 =?utf-8?Q?Benn=C3=A9e=22's?= message of "Wed, 3 May 2023 10:12:25 +0100")
References: <20230503091244.1450613-1-alex.bennee@linaro.org>
 <20230503091244.1450613-4-alex.bennee@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 03 May 2023 12:30:12 +0200
Message-ID: <878re5so5n.fsf@secure.mitica>
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
> This varies by accelerator. Also mention the modern bear trap that is
> ASLR.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

> +Relocating code
> +---------------
> +
> +On modern kernels confusion can be caused by code being relocated by
> +features such as address space layout randomisation. To avoid
> +confusion when debugging such things you either need to update gdb's
> +view of where things are in memory or perhaps more trivially disable
> +ASLR when booting the system.

Makes sense for everything except debugging ASLR O:-)


