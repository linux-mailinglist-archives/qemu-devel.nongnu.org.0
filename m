Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DF5680529
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 05:47:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMM4C-0003AT-13; Sun, 29 Jan 2023 23:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM3n-00031N-6S
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:46:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM3l-0006AS-R8
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:46:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675053985;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g2e6B/Hlbj/KRSqA7n1bDxKoOF7IkEqfLRb1w4IvCsY=;
 b=Af49381UNLzGWIekB8Jyo+pU9DsFTkL0tsL/iH9VtVIRQtfnU0DpulOS0oOyfWkKR6euyR
 z1iHfUScAjUlopXbtlxqruJPien8kYmGCPWQ6aZGbt2bX22KOv3ltI2sUgki/M+yfIaLJD
 qWHOXyHFXBIESxOg/gJMsbRsCKH2SEo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-650-NDdMFGPVOfWsV0MamTNHqw-1; Sun, 29 Jan 2023 23:46:21 -0500
X-MC-Unique: NDdMFGPVOfWsV0MamTNHqw-1
Received: by mail-wm1-f72.google.com with SMTP id
 h18-20020a05600c351200b003dc25fc1849so6422391wmq.6
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 20:46:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=g2e6B/Hlbj/KRSqA7n1bDxKoOF7IkEqfLRb1w4IvCsY=;
 b=j2rliuKeSPHmus2qe6/IgtpnUV4WOznmaoWZ+ZIPCZkLyKPv2ZSxxo8ViVe3E+Otb7
 biNKyA3bbyb+aXusH1zCpB8RO99/C2TRQNy5X4Urs8E88huTfQUGPn7ZnzW9t8vTUOU7
 9777WsC3HcgIL2r0/HQEiTKtX/GrHGnsEsFCQrjVeV5nJSASOqxkIYNIx/uvCb8Fjpcu
 UmlhF+11mRD0bSwRwHGIG0/1w8jh6AvMXtpyENaq53AdETarMUAu/G0Zx86ScgCOpX1Q
 t4tibBn5uQNKudU4CRYTgB8e7G3pf9oxXoOkzFXpqU9ukOGWKe3NIf5mqRezp4IUzXGj
 qHRw==
X-Gm-Message-State: AO0yUKVzAl9+Tyl9z5pc7PbwplKNhOSM/PULOgbSKN2z9mD7Yw4hV7Dc
 Tc0YD4HEeoK06o2cB2QDrhWFtVBIZYRpjoRHMHrrSdk8/Yf1pGLZ7vmrPp/laaLn5tDgOnQQawd
 0mAzQDTcI+/NsDo8=
X-Received: by 2002:a7b:cbd0:0:b0:3dc:5ab8:7d74 with SMTP id
 n16-20020a7bcbd0000000b003dc5ab87d74mr1370409wmi.3.1675053980224; 
 Sun, 29 Jan 2023 20:46:20 -0800 (PST)
X-Google-Smtp-Source: AK7set/ivg8CyPDdMS76u71qcuN2rPyJVSxSH7nRw+lhM5TlT6pu1GgY2xgUNgtInNuTjYfbxvNl0A==
X-Received: by 2002:a7b:cbd0:0:b0:3dc:5ab8:7d74 with SMTP id
 n16-20020a7bcbd0000000b003dc5ab87d74mr1370394wmi.3.1675053980064; 
 Sun, 29 Jan 2023 20:46:20 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 l16-20020a7bc350000000b003d9aa76dc6asm17519598wmj.0.2023.01.29.20.46.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:46:19 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,  Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 08/11] tests/qtest/migration-test: Build command line
 using GString API (2/4)
In-Reply-To: <20230120082341.59913-9-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 20 Jan 2023 09:23:38
 +0100")
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-9-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:46:18 +0100
Message-ID: <871qncmxyd.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> Part 2/4: Convert shmem option.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Again, much nicer that what was there.


