Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFB468D200
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 10:04:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJt9-0002Pk-SL; Tue, 07 Feb 2023 04:03:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPJt4-0002LF-3I
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:03:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPJt2-0007mp-9s
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 04:03:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675760615;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=lW/jE0zPpahHnaommJ5Lg5RolThxUue1rw5riCt1dlk=;
 b=OmvcoUucHNAHk/Zcbd9xSmgPYrMtfpD86aplekIlYY/940BKRP0DYN8H58f2MIGNNZ3iJ+
 HnxzaQqS45F+9QWz+7kgPxtoxb6hZj2aP23Kid7fW43mlAy+ZtxTsQCFPcNh2/J1lmje9p
 WgnZqGBQQv8JcaSM+5h7OQKb5hu2Kz4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-245-UWxX447FMgqDbMxWcd9Ogw-1; Tue, 07 Feb 2023 04:03:34 -0500
X-MC-Unique: UWxX447FMgqDbMxWcd9Ogw-1
Received: by mail-wr1-f70.google.com with SMTP id
 i9-20020a0560001ac900b002bfda39265aso1877812wry.13
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 01:03:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lW/jE0zPpahHnaommJ5Lg5RolThxUue1rw5riCt1dlk=;
 b=aWEN/yZpG2BhS4lYODkJQ43NwrIXXkNelFtEUbRfvJBpI71tFhBPI2pU3V0cvsyMXw
 liKGpNTiITN7doK7wEMawuyARFXETXmIose7FFTVCtpSXHcKmDVcjRmObbwGYwOCdaQ0
 ILcMr1ndGorDbUA0mEBbodTRir0635JOnXK1b3HXTRdZeb4Zer90z4Vnf164Dp0QaPM7
 HRGLn2bJJ7t+dzNu1nwlj79TUIL8xX9hWq3SRsca2gCtWWnr7SIld0imtydtdCMmYNEQ
 j0Q0D4LmzrQyJH2VD78sdNrpz/FEN50XaYo+iHhoBeLzayrRkEsGvRY/zDrD2Q5L+64x
 osSQ==
X-Gm-Message-State: AO0yUKUUhKwjbV5JRFicwHHsDcZjCYo5fDE0piTfrpRRbVFCxnERa/of
 Efc9FhaxpennI03mrSg9bkBRCcT9QUkGdm9MPj+vkQsb6uvxZ9VfWAPgewy90kAGIM562ozNr5N
 62hszvBruJehsj0U=
X-Received: by 2002:a05:600c:3190:b0:3dc:1ad6:55fd with SMTP id
 s16-20020a05600c319000b003dc1ad655fdmr2315780wmp.32.1675760613108; 
 Tue, 07 Feb 2023 01:03:33 -0800 (PST)
X-Google-Smtp-Source: AK7set8O0G8akmvoOpBGGy9GEnj6kr14NbEdIfsuMK5MsLpYTFCoABjQ/UXFyhf1QO3KEl1T3vNG9Q==
X-Received: by 2002:a05:600c:3190:b0:3dc:1ad6:55fd with SMTP id
 s16-20020a05600c319000b003dc1ad655fdmr2315768wmp.32.1675760612913; 
 Tue, 07 Feb 2023 01:03:32 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a7bc30a000000b003dfee43863fsm11227216wmj.26.2023.02.07.01.03.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 01:03:32 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  marcandre.lureau@redhat.com,  mst@redhat.com,
 imammedo@redhat.com,  ani@anisinha.ca,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  philmd@linaro.org,  wangyanan55@huawei.com,
 jiri@resnulli.us,  jasowang@redhat.com,  pavel.dovgaluk@ispras.ru,
 pbonzini@redhat.com,  zhanghailiang@xfusion.com,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com
Subject: Re: [PATCH 11/12] migration/colo: Improve an x-colo-lost-heartbeat
 error message
In-Reply-To: <20230207075115.1525-12-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 7 Feb 2023 08:51:14 +0100")
References: <20230207075115.1525-1-armbru@redhat.com>
 <20230207075115.1525-12-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 07 Feb 2023 10:03:25 +0100
Message-ID: <87wn4taluq.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Markus Armbruster <armbru@redhat.com> wrote:
> The QERR_ macros are leftovers from the days of "rich" error objects.
> We've been trying to reduce their remaining use.
>
> Get rid of a use of QERR_FEATURE_DISABLED, and improve the somewhat
> imprecise error message
>
>     (qemu) x_colo_lost_heartbeat
>     Error: The feature 'colo' is not enabled
>
> to
>
>     Error: VM is not in COLO mode
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Althought in this case which error message is better is not so clear.
Colo mode is compiled in, but it is not being "enabled".

Later, Juan.


