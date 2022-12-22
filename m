Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEAFF653CFD
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Dec 2022 09:28:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8GvH-0008Sa-Uu; Thu, 22 Dec 2022 03:27:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8Guz-0008PJ-6j
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:27:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p8Guu-0008Bd-Cr
 for qemu-devel@nongnu.org; Thu, 22 Dec 2022 03:27:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671697622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9x5N4FHhT7gdXEi8CzrWldYDSZUzeFZ+fN9t5oMwRQk=;
 b=bE2zj8FZP9La4ENjqyJj4gpwmca6JAdqKatuze24Sqj4y0Tx9iYkiWScIvxE1zh+zzU7Y0
 z3oHjXjxjWin1ITMbtJvMxdSDIkF0maYULYWODahcIlHX/u5tJ76vVAeDP6gdzmhGtvBG4
 9w/O7IDA6nvup4hL1hU+PRB0h9+KmZ8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-484-vFECujVwN5ivQneR-YFo9Q-1; Thu, 22 Dec 2022 03:27:00 -0500
X-MC-Unique: vFECujVwN5ivQneR-YFo9Q-1
Received: by mail-ed1-f70.google.com with SMTP id
 v4-20020a056402348400b0046cbbc786bdso1025622edc.7
 for <qemu-devel@nongnu.org>; Thu, 22 Dec 2022 00:27:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9x5N4FHhT7gdXEi8CzrWldYDSZUzeFZ+fN9t5oMwRQk=;
 b=WuTPT3ZNp73fCr94WP1q3cTE5oi8ruCCDJ6IA/HLGNVctDzximShKqOv+VSISnwIDl
 ace4sSDmLx0qJ9Z1XNXAqq3GsEjqvh5W7JN4pF6YZRGfPX0IwC/49vCqZh6qr+iTbOY3
 ockdvPXv0p00+QGmpEO15EVL0FpbRjlOcv8PN7gt1892yFd1oRe3odPHnqlOXyYxsudh
 PkL+5RoHcq6LNH0INvSTgJYlwXtTvk6VlsKHrQhLCPRzePT56yb4BDzSe2Xp3fBn9pOm
 H6msmW57sN+GQmMY6w7FxhmovBpfjD/sdg4q+FdLnd8uWza+mBKfGwQGZUvGiOetkO5S
 sglA==
X-Gm-Message-State: AFqh2kredWNG61sARuYjbBsJ6lRy+uTV+wHgD2E6qaaX/2jsusAPrRRl
 +Za93/L4VwB0qJ26bqHLAhzfldKxDu5dIl4XjU8m+/UtTgtu0Uk2DXJzwr2AmHLNforLsokbmgu
 oiOF0zvvg/4TeUwo=
X-Received: by 2002:a05:6402:31e4:b0:462:6d7d:ab09 with SMTP id
 dy4-20020a05640231e400b004626d7dab09mr4253047edb.38.1671697619711; 
 Thu, 22 Dec 2022 00:26:59 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtaP8dCzu5SyJE9qpSQl/E36x7m3HleAXvhd000yZMX/HnTKMGglmd2nOAsKIBd82D7UCWmgg==
X-Received: by 2002:a05:6402:31e4:b0:462:6d7d:ab09 with SMTP id
 dy4-20020a05640231e400b004626d7dab09mr4253033edb.38.1671697619546; 
 Thu, 22 Dec 2022 00:26:59 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 y16-20020aa7d510000000b00462e1d8e914sm101835edq.68.2022.12.22.00.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Dec 2022 00:26:58 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 0/2] gitlab: improve debuggability of jobs
Date: Thu, 22 Dec 2022 09:26:43 +0100
Message-Id: <20221222082642.859706-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221103173044.3969425-1-berrange@redhat.com>
References: 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Queued patch 1 while the second is figured out, thanks.

Paolo


