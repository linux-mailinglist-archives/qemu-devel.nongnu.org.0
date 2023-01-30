Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CFF680537
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 05:49:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMM5v-0004tG-AV; Sun, 29 Jan 2023 23:48:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM5r-0004sb-OF
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:48:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pMM5m-0006I2-Gl
 for qemu-devel@nongnu.org; Sun, 29 Jan 2023 23:48:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675054095;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f1hbXSjYSXulPcGxYTK58WDLylli9Ryc/QtoUHqAfxg=;
 b=K4RhaItI7p2zkZtUVaNhKFx7Xst8fbtS2e9e0iDRkEe7oetk3soy0HZSW1tK9edJ/EFDjl
 1e9bl7H90QxjFiu6rgLVzv5Oi+/l3ajzhftS8b86g04Fn0lARgVv3ZQzeIo006cbul6tpo
 FVrMJVU6FFQbQA6ZPCK2ixxDrraRogc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-209-leVFRJbdPRWjZ92f4k2-gg-1; Sun, 29 Jan 2023 23:48:13 -0500
X-MC-Unique: leVFRJbdPRWjZ92f4k2-gg-1
Received: by mail-wm1-f71.google.com with SMTP id
 j24-20020a05600c1c1800b003dc4480f7bdso3866692wms.5
 for <qemu-devel@nongnu.org>; Sun, 29 Jan 2023 20:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f1hbXSjYSXulPcGxYTK58WDLylli9Ryc/QtoUHqAfxg=;
 b=xUG1tboyQs4LJdDyjg+lfPsqAiThhQNoLRKZCvPxMdOSrxj6wosxvxy0/WREcVnvRj
 2fRUNPlhSs3gu9LiVrcl4Z9n7J8s+0GJXQVSVmHAM5bNobOGQzlZeiplgBJvKhYYDE6+
 jiasje7C74kamJlXeGanI+Ig5GSFC3Pc5tH0MDZodXIo7SM/rlEKhFbYP8C1EPyM9uHS
 KwKYZ06/wxzK8T5v7W0bo9nxCUW9w08hmh7+reFV4yJBfoXhW/vxI+XZpT/u/casvmeZ
 vsd7imDPj0LY/ZVzGIw0NnV9+kPsAfMCcT4dmwFgScvOQW2VEH+rwqqcbJdHVnC3Y2z3
 x5GQ==
X-Gm-Message-State: AO0yUKU6hIBNJVL8BL8Zzb/2Zr693/7nk2LaGcLxnJ8sRgNk3UucpCWR
 /bu6AxplmFF0A+0BpQwPhgo8GdDxM0y9fycltICJO0WMYiL6MoaleJm9TscJ7/if8sQpS1N42WQ
 JOmSjJS4y9MjGBI0=
X-Received: by 2002:a05:600c:5114:b0:3dc:54e9:dfd7 with SMTP id
 o20-20020a05600c511400b003dc54e9dfd7mr3611288wms.25.1675054092610; 
 Sun, 29 Jan 2023 20:48:12 -0800 (PST)
X-Google-Smtp-Source: AK7set9HzWqFnOzUlNqKnf3PnMt9Oq3sZR2a7qKu6BQxDTGjfxFCbP2qpB0/OgUwVRHo9JqD1o2C5g==
X-Received: by 2002:a05:600c:5114:b0:3dc:54e9:dfd7 with SMTP id
 o20-20020a05600c511400b003dc54e9dfd7mr3611272wms.25.1675054092419; 
 Sun, 29 Jan 2023 20:48:12 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 m14-20020a05600c4f4e00b003a3442f1229sm16544990wmq.29.2023.01.29.20.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 20:48:11 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  Paolo Bonzini <pbonzini@redhat.com>,  "Dr. David
 Alan Gilbert" <dgilbert@redhat.com>,  Thomas Huth <thuth@redhat.com>,
 Fabiano Rosas <farosas@suse.de>,  Laurent Vivier <lvivier@redhat.com>,
 qemu-arm@nongnu.org,  Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v3 10/11] tests/qtest/migration-test: Build command line
 using GString API (4/4)
In-Reply-To: <20230120082341.59913-11-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Fri, 20 Jan 2023 09:23:40
 +0100")
References: <20230120082341.59913-1-philmd@linaro.org>
 <20230120082341.59913-11-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 30 Jan 2023 05:48:11 +0100
Message-ID: <87sffsljas.fsf@secure.mitica>
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
> Part 4/4: Convert rest of options.
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>


