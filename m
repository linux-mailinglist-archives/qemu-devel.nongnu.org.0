Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA70698157
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 17:51:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSKzU-0001wc-68; Wed, 15 Feb 2023 11:50:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSKzR-0001v3-C4
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:50:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSKzP-0004vh-QT
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 11:50:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676479838;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PJElrQ+SaBs2pWz1TyIluKMvkuy1aSWNqwkbjvufUgc=;
 b=SGBJNIL2Z/J2R4nqyr2OLl077jE2iC2BqTR440gTn3K58066c9Qt0dWf/gQyZuax36fZsH
 i8PcOC5SOWGPSNXo90wTo/hOswuGc86GU2rO7Uyj/TVg5aACX81kaPRlb5lW+BmIgjcc6q
 ACemPpCYPwDev2wMPq8w8X4Ng+Uuj0s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-117-XtQZe0X9MXmKAmZpfmFwIA-1; Wed, 15 Feb 2023 11:50:36 -0500
X-MC-Unique: XtQZe0X9MXmKAmZpfmFwIA-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg9-20020a05600c3c8900b003e1e7d3db06so1425191wmb.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 08:50:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PJElrQ+SaBs2pWz1TyIluKMvkuy1aSWNqwkbjvufUgc=;
 b=VtOE67CeWJ/MJ9HlDtn04dT1+HIXk4AiBGCTSgNo1awIwd+raTBODvZbGIP06Out/D
 aGGeUtHAJAbvLmnIwfOVfpsWHhjEnxQyx1qcAFWssbx1TKeUZYEbxTZcuLPnHBxvsEj/
 Y41ELhAKAxw4bZWdV6JS2en4YFzmHpyTuL2s7yPP5b0cg1r8WnGyLI4ptY1xytv5WnRt
 i4zzG546UpK52GAS9lTOlFO9kUBeWav1iTcT50IMOdTW5EdT/jXZpaxWBFvEyN+5LJUK
 DuAGfRrnXUFZwGTB29N0WiRsk08n7kIrZLIhjdhTNqbEnQUi/QJ7pgIz45bul9RHhZIk
 XVUw==
X-Gm-Message-State: AO0yUKVsIE8I1d4rYaOzwc/Lr2v0KTlNnWwE951YKehEXV0gTCS7Fv9W
 am47+RH0LnN4xIhdbMR/sMA5jUE6IMIDcBGIN9IeYoJ8x0ynKC9SnorzqssJXwzGHwlFSoYbyZ4
 9UxEJBJtNR9sRM5Q=
X-Received: by 2002:a05:600c:747:b0:3dc:5baf:df01 with SMTP id
 j7-20020a05600c074700b003dc5bafdf01mr2388279wmn.5.1676479835559; 
 Wed, 15 Feb 2023 08:50:35 -0800 (PST)
X-Google-Smtp-Source: AK7set/w7LQlPPrgQJUJtU9Bzy/CRgVEH5jmJSwTETkM8O31vWDXotKhGTVKFzwfbsJTjTH9DEZNKg==
X-Received: by 2002:a05:600c:747:b0:3dc:5baf:df01 with SMTP id
 j7-20020a05600c074700b003dc5bafdf01mr2388265wmn.5.1676479835323; 
 Wed, 15 Feb 2023 08:50:35 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 l9-20020a05600c4f0900b003dff870ce0esm3054704wmq.2.2023.02.15.08.50.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 08:50:34 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-trivial@nongnu.org,  Fam Zheng
 <fam@euphon.net>,  Stefan Hajnoczi <stefanha@redhat.com>,  "Dr. David Alan
 Gilbert" <dgilbert@redhat.com>,  qemu-block@nongnu.org
Subject: Re: [PATCH] migration/block: Convert remaining DPRINTF() debug
 macro to trace events
In-Reply-To: <20230215153517.30732-1-philmd@linaro.org> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Wed, 15 Feb 2023 16:35:17
 +0100")
References: <20230215153517.30732-1-philmd@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 15 Feb 2023 17:50:32 +0100
Message-ID: <87r0uq27qf.fsf@secure.mitica>
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

Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:
> Finish the conversion from commit fe80c0241d
> ("migration: using trace_ to replace DPRINTF").
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.

Thanks.


