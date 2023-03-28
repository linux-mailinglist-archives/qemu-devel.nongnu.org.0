Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C0A6CC0BA
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 15:27:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ph9LJ-0006ZX-Dg; Tue, 28 Mar 2023 09:26:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ph9LG-0006ZK-P9
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:26:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1ph9LF-0005cC-9a
 for qemu-devel@nongnu.org; Tue, 28 Mar 2023 09:26:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680009984;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HfpAnnhpzwoS0y1J5bllzIaDAwH0AJCbTirLnnUAGZU=;
 b=LehlkkQNPbAq5zUUWNeoL7k6kWki2ErJYRBSdDheHNgPCDFKu+k4smUnKRT/KndncNxSkM
 FxNEKUvcymFp6D3Nof4cqfNkFEXLPtfau4xUVF8DsIwFnAIKVKV7rPE/I0jc5ODegouK8U
 thAWruMpVRc4IADaj5fgnUkXX12PETM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-tHs0BCxsMj6EWNexAyrtXw-1; Tue, 28 Mar 2023 09:26:22 -0400
X-MC-Unique: tHs0BCxsMj6EWNexAyrtXw-1
Received: by mail-wr1-f71.google.com with SMTP id
 d5-20020adfa345000000b002d716fc080fso1142667wrb.22
 for <qemu-devel@nongnu.org>; Tue, 28 Mar 2023 06:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680009981;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HfpAnnhpzwoS0y1J5bllzIaDAwH0AJCbTirLnnUAGZU=;
 b=ikgw5BcveQnRpvFM+7JuI4SpgnzgX/xryWNskUuLqyaPRmGy0IpM7RjcQxPC8Hpg4y
 7pBZ36aZ4WaoOM2eSSUx/7prN71JAM/w00iGaND2HncNAeF390dAMu16yC28hcZkpZDB
 9B00fxUkn/LFAePIt4yfkvfovncJQrpkGsv0HiyGQj9eOx3q9TlXxqvBdgJNzfOIp0HQ
 ug4tNwXlXMePHMPHTyGyxyERfFP8yWNbvvtC5YXARnVqqEB9yo7tCmBK+y/IYM2Kz4Of
 aHJZ0Qk7Qn85/z/Uhr8YQerIIf5yNgOcUBn8E0/zwG4u0CvgXYv/GDgcAdzhfuaNlRAA
 fSiA==
X-Gm-Message-State: AO0yUKWGGGvUb3Z+iuCSkJaxTe2AQ+xDnq8SlVpTQ879Zil/ndJEXh/O
 Z9HlUJAaeiCQAAYApPxcPuCM+DNKx8IH08p0f0QcyUVN3UVf7eS/k+PfyTp6ruKOicqpo1T4oru
 Dnfo+ckD/tm21ktA=
X-Received: by 2002:a1c:f217:0:b0:3ee:5c4c:bdb0 with SMTP id
 s23-20020a1cf217000000b003ee5c4cbdb0mr12191965wmc.39.1680009981018; 
 Tue, 28 Mar 2023 06:26:21 -0700 (PDT)
X-Google-Smtp-Source: AK7set+9k+qxjEKq69AeyHo4aWlMkRK1/m++XAdqOb5M2PWPTxIzvRNupwpfJzpG77cURRMjujrjLg==
X-Received: by 2002:a1c:f217:0:b0:3ee:5c4c:bdb0 with SMTP id
 s23-20020a1cf217000000b003ee5c4cbdb0mr12191953wmc.39.1680009980786; 
 Tue, 28 Mar 2023 06:26:20 -0700 (PDT)
Received: from redhat.com (62.117.238.225.dyn.user.ono.com. [62.117.238.225])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a7bcbc6000000b003ed243222adsm17089019wmi.42.2023.03.28.06.26.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 06:26:19 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: =?utf-8?B?5p2O55qG5L+K?= <a_lijiejun@163.com>
Cc: dgilbert@redhat.com,  qemu-devel@nongnu.org
Subject: Re: [PATCH] migration: remove extra whitespace character for code
 style
In-Reply-To: <20230317095713.1539556-1-a_lijiejun@163.com> (=?utf-8?B?Ig==?=
 =?utf-8?B?5p2O55qG5L+KIidz?= message
 of "Fri, 17 Mar 2023 09:57:13 +0000")
References: <20230317095713.1539556-1-a_lijiejun@163.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Tue, 28 Mar 2023 15:26:18 +0200
Message-ID: <87fs9pt3b9.fsf@secure.mitica>
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

=E6=9D=8E=E7=9A=86=E4=BF=8A <a_lijiejun@163.com> wrote:
> Fix code style.
>
> Signed-off-by: =E6=9D=8E=E7=9A=86=E4=BF=8A <a_lijiejun@163.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued for 8.1.


