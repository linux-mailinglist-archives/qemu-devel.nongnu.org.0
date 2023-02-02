Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A687E6884F0
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 17:58:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNcuH-00076O-8s; Thu, 02 Feb 2023 11:57:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNcuE-000764-RC
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:57:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNcuD-0000I5-E1
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 11:57:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675357068;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hlR/PJQ4c/9V2JqYMm2ztJuyu2tt3l+KQ8/+ADXpGnA=;
 b=S+/yJWJj6TQfDPaVXLp0J0Rf+pt4ffkYlrOC1wwev43yWUtD5ngGAWGUwys+ZbbZ/e5bG5
 7pA8RDy9L3THiRlXjraK3y1GEnCE7ry+DTgugkgADT+1bbPfre9JMs+VoWqq6T7qQ0tSPz
 J5NBRMyHpxR7Yahk50HoQ5HvkFbwz5w=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-620-TDsNxXzUOmW-T4lAw_FoYQ-1; Thu, 02 Feb 2023 11:57:47 -0500
X-MC-Unique: TDsNxXzUOmW-T4lAw_FoYQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 o8-20020a05600c510800b003dfdf09ffc2so899935wms.5
 for <qemu-devel@nongnu.org>; Thu, 02 Feb 2023 08:57:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hlR/PJQ4c/9V2JqYMm2ztJuyu2tt3l+KQ8/+ADXpGnA=;
 b=5rSbs1lwHWE2dCVpfiAYWj7+g/0QcULrA4vYy+hPh9h0e5OqQxB+sRm5f0HBj67wbT
 9vEyFrsjaKhjJlt13plVHFd7cgyj11ccqk7fVjreawFOPzhQjFSpZPcVCRmJ/aZ1aU4L
 b/ljS+jgxJwpziWc4ey88rW3QM1UVTWTS1qxuW9tFIFv37rQg//ey0QLyv/BJ9ZxZgk5
 QupqTeiCqblk44PPCzHe+J1Z2yg5uFg02cbLzUD2sJtC9KKACrYPX2jC2bylxqSwyyQw
 QKCPV+VeFPb3jGS09JAuUELQ4tE9L1AqyVWldZtsfEswHdFaYv4IOIXIuALIhtUqQvZn
 ehTw==
X-Gm-Message-State: AO0yUKURRoc8H4Z6agQ/ju6itfrVnWK9QsDC9DdQUGAEa43UVe6craae
 I7B86dbh60/ebWIL9Aqhq9EUCOu8FkD9/4FDBqe6/s7o2MpUvzRiXIj6A3bD0h1ns7S6ZuE+2qK
 K8GNjWMFzpekqAg4=
X-Received: by 2002:a05:600c:1e0b:b0:3da:1e35:dfec with SMTP id
 ay11-20020a05600c1e0b00b003da1e35dfecmr6803001wmb.4.1675357066008; 
 Thu, 02 Feb 2023 08:57:46 -0800 (PST)
X-Google-Smtp-Source: AK7set+Ywo9XMfmrnsI2Njk9rdOpvdEubwJxdWM0qqRtOPrCa0uA5lqLoMWhfzSgtPe/C20D1q8mQg==
X-Received: by 2002:a05:600c:1e0b:b0:3da:1e35:dfec with SMTP id
 ay11-20020a05600c1e0b00b003da1e35dfecmr6802994wmb.4.1675357065865; 
 Thu, 02 Feb 2023 08:57:45 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 j14-20020a05600c130e00b003df241f52e8sm193124wmf.42.2023.02.02.08.57.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 08:57:45 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: qemu-devel@nongnu.org,  qemu-ppc@nongnu.org,  "Dr . David Alan Gilbert"
 <dgilbert@redhat.com>,  Daniel Henrique Barboza <danielhb413@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>,  mopsfelder@gmail.com
Subject: Re: [PATCH 2/2] tests/migration: add support for ppc64le for
 guestperf.py
In-Reply-To: <20220809002451.91541-3-muriloo@linux.ibm.com> (Murilo Opsfelder
 Araujo's message of "Mon, 8 Aug 2022 21:24:51 -0300")
References: <20220809002451.91541-1-muriloo@linux.ibm.com>
 <20220809002451.91541-3-muriloo@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Thu, 02 Feb 2023 17:57:44 +0100
Message-ID: <87mt5wt37b.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Murilo Opsfelder Araujo <muriloo@linux.ibm.com> wrote:
> Add support for ppc64le for guestperf.py. On ppc, console is usually
> hvc0 and serial device for pseries machine is spapr-vty.
>
> Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


