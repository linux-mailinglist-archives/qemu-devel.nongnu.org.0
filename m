Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B80568052B
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 05:47:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMM4k-0004BE-MX; Sun, 29 Jan 2023 23:47:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM4i-0004Ab-7C
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:47:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM4g-0006Eb-Tu
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:47:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675054042;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o0mqG1HcqWmINKor7Wnax03MkI70dAL8imabKt5Un+g=;
 b=Aa7htKu4XhUtnLEZrPYI1tz+3jhIOlJOFpRD7cEsmIwciJ9Kha/4246MDxUuR5IgGE0osG
 cULXlgAxFc3yeqi8DEsWlhG3rwX86fbZY+xj6IO6WRgilJzCDWLALabDAbow5nfz+sh2aT
 hp4XJEZuG96IojxiqiUzJ5+hI2IDVTU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-101-bewS4oZgOGa-YPV5KhccHA-1; Sun, 29 Jan 2023 23:47:19 -0500
X-MC-Unique: bewS4oZgOGa-YPV5KhccHA-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay19-20020a05600c1e1300b003dc54daba42so1786911wmb.7
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 20:47:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o0mqG1HcqWmINKor7Wnax03MkI70dAL8imabKt5Un+g=;
 b=aUeIMCnVNz4ZdK9AXlZ/ubcUUt0CG7EEAblTlHsca3LsdAw0V8cnudcdb2zkQhPd1K
 BrDFIP7cP/6mbXBHwxln7hqvJ7GLopk+/RO12VuaKqpkiX8sVZ9OXl3AMO9xAHQrjHWE
 6s30GhjsNgyb12As0qrweuQFIuliGJP3DrZU5q1+lq1ckpU+/3iUWYKPE/8fSVsOA/hY
 EP25sKOPFprJRnUhYbwvsRDhR1M9FtE3K8rnl/8nYbMRZZ3Lam8G3dEpwpA53ci3bDxf
 lYk2Vu7M/gXPDXSKI/Gx2iXxBp72suN2rnmxQaK1EKQr3kJoYlqJXZ6acvfEzf793lj6
 2FWA==
X-Gm-Message-State: AFqh2kongepfgEN2XFB0HYmAV5FnJDy8S33S+uH1HiARfxx+dinHWPIO
 6QWezTqiPv7NmfSvoC/PruZ+abfdfPY9YW/Kh5p4RpY4hFaRcypL248wmi2ieLCvFZeYM7aWGcg
 euxaT9Rb6YtzWjOk=
X-Received: by 2002:a1c:6a10:0:b0:3da:f665:5b66 with SMTP id
 f16-20020a1c6a10000000b003daf6655b66mr51195851wmc.6.1675054038851; 
 Sun, 29 Jan 2023 20:47:18 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuM3t/bhCEw6EWfyvOYUAqsHR73atKIbj66U7KjIKbjsb1DiD/o/ofICsEL5hEGr64uHYb3kA==
X-Received: by 2002:a1c:6a10:0:b0:3da:f665:5b66 with SMTP id
 f16-20020a1c6a10000000b003daf6655b66mr51195842wmc.6.1675054038598; 
 Sun, 29 Jan 2023 20:47:18 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 u14-20020a5d434e000000b002bfbda53b98sm10578037wrr.35.2023.01.29.20.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:47:17 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,  Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 09/11] tests/qtest/migration-test: Build command line
 using GString API (3/4)
In-Reply-To: <20230120082341.59913-10-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 20 Jan 2023 09:23:39
 +0100")
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-10-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:47:17 +0100
Message-ID: <87wn54ljca.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
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
> Part 3/4: Convert accelerator options.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


