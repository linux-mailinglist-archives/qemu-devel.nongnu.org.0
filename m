Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A668358C7F7
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 13:56:33 +0200 (CEST)
Received: from localhost ([::1]:52086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oL1N2-000466-8t
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 07:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oL1LB-0002cP-6f
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 07:54:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:34850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oL1L7-0007YC-F7
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 07:54:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659959671;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=29o5aG7xWEPkOGBqlmhhH98WiozzmisaS73s/Rqh+ng=;
 b=QAbqkmqPRjpyLosjrR0jND2VW3yJV3/tjHOAN1IXKxjVGxqPyXWhopzEjxkYYvcwH4CmiS
 vqfwd8Ty2J0Zw9V6hiRdlbnRlONQKAdSP0d41/h9xkZqnSq4R/6snu9W6JzfgEzomO4BVg
 ACPoGmup4X7BGBAsPQ91c1h5nrjEEoU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-519-rKvJEHzQMn2OgGntdtKPVQ-1; Mon, 08 Aug 2022 07:54:30 -0400
X-MC-Unique: rKvJEHzQMn2OgGntdtKPVQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 v5-20020adfa1c5000000b002205c89c80aso1360580wrv.6
 for <qemu-devel@nongnu.org>; Mon, 08 Aug 2022 04:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=29o5aG7xWEPkOGBqlmhhH98WiozzmisaS73s/Rqh+ng=;
 b=4KLwi/TAUSz2JtUcjLZJkccQcmlQy8XUy5IMeH6vGhWZdI67ec5+Te4832O5u4A5Dj
 wIqPhTrFT3wvZ6qxCf0M9ysHKwg4gwWIus1XvYSBMdKm4AuJP58uunFVfTSVfZ8MLGx9
 Iv61kUE39c/FUDo3n/iCFcEklyR7hMzD9Oi3BTbv8ofrbS0s8pwF8jbM5qwmimdluLcd
 OXYrZ5NOYxHGykqoq283uljgyJVzCLIZ9EteiGt7Y5AFS4f1my0DjIhsnGekGXH1udqh
 JFz4KDMiFO5wUgziqULf5Q7v/9iarFM0IzyIkKgUf26Re6nItI91BRQSbq98MeRrtill
 L6hw==
X-Gm-Message-State: ACgBeo2aAUpT5K2MqR6I6mIBKktqiHbTucRXuzITBwavW1KLktXVONyZ
 nz4uLJaXCxVzihqofU7q0zEgjwuFlFcZB/SHEQk0k+CWQXg1mHu0m6nrNZ4fGyYsAfyDSKugECM
 djb0YRXHAeTOKb1E=
X-Received: by 2002:a05:6000:2ad:b0:221:734b:85cc with SMTP id
 l13-20020a05600002ad00b00221734b85ccmr8360369wry.309.1659959668917; 
 Mon, 08 Aug 2022 04:54:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7cL3SSHQr/1z3VPy8t5NKW6+c/3FP7N0YOdIzlbfJKtbojvt7HPHQ/lSydOakdhqyRiP7qYw==
X-Received: by 2002:a05:6000:2ad:b0:221:734b:85cc with SMTP id
 l13-20020a05600002ad00b00221734b85ccmr8360364wry.309.1659959668724; 
 Mon, 08 Aug 2022 04:54:28 -0700 (PDT)
Received: from localhost (static-205-204-7-89.ipcom.comunitel.net.
 [89.7.204.205]) by smtp.gmail.com with ESMTPSA id
 g6-20020a05600c4ec600b003a3199c243bsm25107530wmq.0.2022.08.08.04.54.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Aug 2022 04:54:26 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: ling xu <ling1.xu@intel.com>
Cc: qemu-devel@nongnu.org,  dgilbert@redhat.com
Subject: Re: [PATCH v3 0/2] This patch updates runtime check of AVX512
In-Reply-To: <20220808074837.1484760-1-ling1.xu@intel.com> (ling xu's message
 of "Mon, 8 Aug 2022 15:48:35 +0800")
References: <20220808074837.1484760-1-ling1.xu@intel.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Mon, 08 Aug 2022 13:54:25 +0200
Message-ID: <87wnbjlzm6.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ling xu <ling1.xu@intel.com> wrote:
> This patch updates runtime check of AVX512 and update avx512 support for
> xbzrle_encode_buffer function to accelerate xbzrle encoding speed.
>
> The runtime check is updated in meson.build and meson_options.txt.
>
> The updated AVX512 algorithm is provided in ram.c, xbzrle.c and
> xbzrle.h.
>
> The test code is provided in test-xbzrle.c.
>
> Previous discussion is refered below:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg903520.html
>
> ling xu (2):
>   Update AVX512 support for xbzrle_encode_buffer function
>   Test code for AVX512 support for xbzrle_encode_buffer

I think this v3 and previous v3 are identical except for mthe link to
the previous discussion.

Later, Juan.


