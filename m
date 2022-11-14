Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C396628E0F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 01:13:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouiob-0000Zx-By; Mon, 14 Nov 2022 18:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouifk-0004ws-2q
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:15:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ouXwm-0005Bc-0c
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 06:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668426494;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:mime-version:mime-version:
 content-type:content-type; bh=ucfH+X8twl2Ws47Bs6a6DYYXobksfor7Ckp6hH8bzJw=;
 b=Gf/oSEzzP2RjEKks9ZgN8LF7YrFy54y++0O0vef6KYkKYGyG5DlU8lblCtw/Wyao1WoAp3
 RS7zVHmeyFsOl1b5zL4yF4AZXSTomyYjh6f9Vrl+FCMcT/cB7OH2kSVuJTLOOI5SkD7CJy
 MGoL6wCcdfRkxhkD3vCuT9uq2JxlqtQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-232-z7Uya3PuP1mAYxLM7oMysA-1; Mon, 14 Nov 2022 06:48:13 -0500
X-MC-Unique: z7Uya3PuP1mAYxLM7oMysA-1
Received: by mail-wm1-f70.google.com with SMTP id
 c10-20020a7bc84a000000b003cf81c2d3efso2833957wml.7
 for <qemu-devel@nongnu.org>; Mon, 14 Nov 2022 03:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ucfH+X8twl2Ws47Bs6a6DYYXobksfor7Ckp6hH8bzJw=;
 b=xLoq4in9sc/F+neVCrd2BhHZaHrmYu7du+Y/FZN65yISxrQXJ0tlwadx3b5XjRA0WE
 FJJy686DykkbChhceemfw5pE1EN5tGV8HkH1QltrZ4UC5YHXjBejSOJujTmaUUVQF5oR
 s+vi1SL70JnF/U7ubc4PKxqPd1/uhW/Y/Ibp+vjEydYGHSyJYBvrOLaakXtioJFxOTrq
 UNFEZGnr7hDH41Ekj9w46V1bpVcDM8s8EomtXY/PdBEjXyf9iZ1OvFlWGx/QTXdrUVX4
 z9qeZZD2x0+CrLLMFenbwKDm+DAsrGTWpG5n9PmXxXJqvsPqaJDIU+xwrRqmclwaeGyQ
 rZ4g==
X-Gm-Message-State: ANoB5pnkygRkwPO8vdpjxzI/OkwO+adsZmjE8oN0tObViGUb357m84dN
 JIGNIFvZZRD6YsVr5Xs0fJnom5EQ7SKmXBRpgEwu2WzcONMucZzyA/ywm2dY0fPwIo3uZWqoC5l
 f5Kyy5CFGoI3WTRk=
X-Received: by 2002:adf:e70e:0:b0:22c:d758:6fcb with SMTP id
 c14-20020adfe70e000000b0022cd7586fcbmr7229535wrm.542.1668426492455; 
 Mon, 14 Nov 2022 03:48:12 -0800 (PST)
X-Google-Smtp-Source: AA0mqf70T+oDUKXKgT3/zn6chPDyqo6Da2/XgYL1A0ufFkEJaA2cqrJ6CIz9B9Su0cIS62L6m6VueQ==
X-Received: by 2002:adf:e70e:0:b0:22c:d758:6fcb with SMTP id
 c14-20020adfe70e000000b0022cd7586fcbmr7229527wrm.542.1668426492262; 
 Mon, 14 Nov 2022 03:48:12 -0800 (PST)
Received: from localhost ([31.4.176.155]) by smtp.gmail.com with ESMTPSA id
 q9-20020a5d61c9000000b0023c508a1c24sm9245591wrv.26.2022.11.14.03.48.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 03:48:11 -0800 (PST)
From: quintela@redhat.com
X-Google-Original-From: Juan Quintela <quintela@redhat.com>, Andre Beausoleil
 <abeausol@redhat.com>
To: kvm-devel <kvm@vger.kernel.org>, qemu-devel@nongnu.org
Subject: KVM call for 2022-11-15
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 14 Nov 2022 12:47:40 +0100
Message-ID: <87o7t969lv.fsf@secure.mitica>
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


Hi

Please, send any topic that you are interested in covering.

We already have some topics:
Re agenda, see below topics our team would like to discuss:

   - QEMU support for kernel/vfio V2 live migration patches
   - acceptance of changes required for Grace/Hopper passthrough and vGPU
   support
      - the migration support is now looking like it will converge on the
      6.2 kernel
   - tuning GPU migration performance on QEMU/vfio, beyond what the V2 work
   delivers


 Call details:

By popular demand, a google calendar public entry with it

  https://www.google.com/calendar/embed?src=dG9iMXRqcXAzN3Y4ZXZwNzRoMHE4a3BqcXNAZ3JvdXAuY2FsZW5kYXIuZ29vZ2xlLmNvbQ

(Let me know if you have any problems with the calendar entry.  I just
gave up about getting right at the same time CEST, CET, EDT and DST).

If you need phone number details,  contact me privately

Thanks, Juan.


