Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2472968D1CC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 09:54:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPJjb-0007k6-FP; Tue, 07 Feb 2023 03:53:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPJjY-0007jp-UX
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:53:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pPJjX-0005W9-H8
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 03:53:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675760026;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=OqL7f+qG83AP5uILxQ47wXxe9G3VLU/7qxetcxwMTSU=;
 b=M4ag/UbtiGVdZ1kmoM9ogNLNSYBGFpIW2lx9nvSuRVF4v/0ADqcE7Y9lO4JV32Nuz2UWEu
 49rLvvLXPUhNdMO0hBignnKQ4QckMPLjE9OO6LBI2elCS635LMIm8MUMijlYPQvWdG3bvD
 Cs0sA7j247VAHu6KQv4CIVIbSDo5fxg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-81-Br1gNbtNOP-gUcuO4Q-BlA-1; Tue, 07 Feb 2023 03:53:45 -0500
X-MC-Unique: Br1gNbtNOP-gUcuO4Q-BlA-1
Received: by mail-wm1-f72.google.com with SMTP id
 m3-20020a05600c3b0300b003dfdc6021bcso6751203wms.3
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 00:53:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OqL7f+qG83AP5uILxQ47wXxe9G3VLU/7qxetcxwMTSU=;
 b=MNlxmSTHNaF4CyzJsgnNq9MhIOudvq6U8BH5pfVNZoOzSnjoQScfk+ejyauqyWEytl
 iq3RrZClXevxveF5mpOCo1W/iri3fh6iNFYi2vDfnn4pIGzBhGcoG5/0vXF+4PfTnDFO
 5i7TAk6mkLi6ZwUBr/tlFsJL6BrYqtfGH0nM61V/9/UFCBUErbfjuE8QqC3GaoElMdl5
 6imz9dXcQWIwmtHgl+tDOEXPvgpt1KhRs9dswXrAlt7pa24580mB0t7URR/MsaNxiqbM
 Yl+CBKi6ya5IzWaf4UG/zd3pUt2vnPhhODKP4mZ0j7ihqMvEz+S1oznEL9Xeom5B8Dob
 JeKw==
X-Gm-Message-State: AO0yUKUHAgDiEK41jsKq7BmWdPI24mlwsLN1F1roqncmJ14eoPZ59AqP
 n9iPMIJ8YrajlMenl3RlEot4uUkjhWTBv4DTV6mZoE27MTCNWwm7sPIiBj2/ZG2IDB3mQW0sCRA
 q83l+JqTIXuAtUzM=
X-Received: by 2002:a05:600c:35cc:b0:3d3:4f99:bb32 with SMTP id
 r12-20020a05600c35cc00b003d34f99bb32mr2323664wmq.36.1675760024094; 
 Tue, 07 Feb 2023 00:53:44 -0800 (PST)
X-Google-Smtp-Source: AK7set/zW/csizbNJrnwGIkdyrk3lArhmStsMNGUE/YtXtF+Dv3YFS+SLfTHniBBndixLdngbmyD/g==
X-Received: by 2002:a05:600c:35cc:b0:3d3:4f99:bb32 with SMTP id
 r12-20020a05600c35cc00b003d34f99bb32mr2323643wmq.36.1675760023947; 
 Tue, 07 Feb 2023 00:53:43 -0800 (PST)
Received: from redhat.com (nat-252.udc.es. [193.144.61.252])
 by smtp.gmail.com with ESMTPSA id
 x14-20020a1c7c0e000000b003daffc2ecdesm18107905wmc.13.2023.02.07.00.53.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 00:53:43 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org,  marcandre.lureau@redhat.com,  mst@redhat.com,
 imammedo@redhat.com,  ani@anisinha.ca,  eduardo@habkost.net,
 marcel.apfelbaum@gmail.com,  philmd@linaro.org,  wangyanan55@huawei.com,
 jiri@resnulli.us,  jasowang@redhat.com,  pavel.dovgaluk@ispras.ru,
 pbonzini@redhat.com,  zhanghailiang@xfusion.com,  dgilbert@redhat.com,
 michael.roth@amd.com,  kkostiuk@redhat.com
Subject: Re: [PATCH 08/12] qga: Drop dangling reference to
 QERR_QGA_LOGGING_DISABLED
In-Reply-To: <20230207075115.1525-9-armbru@redhat.com> (Markus Armbruster's
 message of "Tue, 7 Feb 2023 08:51:11 +0100")
References: <20230207075115.1525-1-armbru@redhat.com>
 <20230207075115.1525-9-armbru@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 07 Feb 2023 09:53:42 +0100
Message-ID: <874jrxc0vd.fsf@secure.mitica>
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
> slog()'s function comment advises to use QERR_QGA_LOGGING_DISABLED.
> This macro never existed.  The reference got added in commit
> e3d4d25206a "guest agent: add guest agent RPCs/commands" along with
> QERR_QGA_LOGGING_FAILED, so maybe that one was meant.  However,
> QERR_QGA_LOGGING_FAILED was never actually used, and was removed in
> commit d73f0beadb5 "qerror.h: Remove unused error classes".
>
> Drop the dangling reference.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


