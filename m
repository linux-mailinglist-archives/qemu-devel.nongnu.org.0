Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A54FC702E27
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 15:32:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyXoq-0001qd-R9; Mon, 15 May 2023 09:00:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXoA-0001aj-Gp
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:00:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pyXo8-0000Ee-6e
 for qemu-devel@nongnu.org; Mon, 15 May 2023 09:00:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684155606;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=RXz6GpFRNCqkzsQgz0zeI1vCuTi2pJ/GKXDb6dpMrCQ=;
 b=OWeOwHq1fWWc2AzBiqasF6PTdmE81RxwhNteaQR7jtBgXMOjpS6W8AO/egCGq+7u+rA2Cj
 iGlqhGMg6f8riyKdlv5XU/qoSIVI+r1PbFGO4+9X1oK28xf/aD6leK1t2g9cHlCFHpXxbt
 Sc+1USbv1jDS1/HFBEYrhr6ibQvk/3E=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-308-uCLXes0fNfW0WhtRAzr7UQ-1; Mon, 15 May 2023 09:00:04 -0400
X-MC-Unique: uCLXes0fNfW0WhtRAzr7UQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f509037a45so22253345e9.1
 for <qemu-devel@nongnu.org>; Mon, 15 May 2023 06:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684155603; x=1686747603;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RXz6GpFRNCqkzsQgz0zeI1vCuTi2pJ/GKXDb6dpMrCQ=;
 b=HOfIf9dBPtBVArda34STivyvwvmFbcSI9snovxX4tovZnMy6yzDRiWE86hkUy64wG3
 lhJaXyhNbYVclUJ0hhzWjhK+UCQt1vtqRauK9CtryiarOaNLg5NxcOD3pCcTyK5RGD1D
 GD2TWxvTO+fDHPRPGb+mFDfWduYnAAXcnGslpSD6RUe4bMf8HroZ6PDz7rvB8iRTi2kF
 L1pq5YpND2kwH+phHEGdcrHUuejO9RH5e6FE+Q+clPo+yUxGI5Zh7RMRZB9jB6H6ghXf
 DcKBs5Cf6liHmaGvSyBHZ2/CzO/n3VdYNA2GvhC9q21U38eKllL/O2Lf1ewHZLz5x5z7
 uZeg==
X-Gm-Message-State: AC+VfDxg6o4h5HSb2fizjdZ/0NT6dwP/RWfS2kl8XEmpgv1drKFc+bhm
 RpzFRUKF8RmFxx1rQ58bDvyuPSLb1716xMxDz9O6slHvgc81x8OU9rh5GA6F5mlPcG7OB3PkSST
 saJxs36lwyx3rB48=
X-Received: by 2002:a7b:cd8c:0:b0:3f4:2775:b45c with SMTP id
 y12-20020a7bcd8c000000b003f42775b45cmr16448790wmj.3.1684155603408; 
 Mon, 15 May 2023 06:00:03 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6qVltedw/HQaq7s6UeqkJRfWeh+QZoxp/76Xu7ZvED4jdmrRrlBRt85qaL7Uwu2hGkiSp+Dg==
X-Received: by 2002:a7b:cd8c:0:b0:3f4:2775:b45c with SMTP id
 y12-20020a7bcd8c000000b003f42775b45cmr16448780wmj.3.1684155603130; 
 Mon, 15 May 2023 06:00:03 -0700 (PDT)
Received: from redhat.com (static-92-120-85-188.ipcom.comunitel.net.
 [188.85.120.92]) by smtp.gmail.com with ESMTPSA id
 3-20020a05600c028300b003f4e4f51f64sm14236672wmk.7.2023.05.15.06.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 May 2023 06:00:02 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-devel@nongnu.org,  marcel.apfelbaum@gmail.com,  mst@redhat.com,
 philmd@linaro.org,  david@redhat.com,  peterx@redhat.com,
 pbonzini@redhat.com,  den-plotnikov@yandex-team.ru,  lersek@redhat.com,
 kraxel@redhat.com,  dgilbert@redhat.com,  armbru@redhat.com
Subject: Re: [PATCH v3 1/3] pci: pci_add_option_rom(): improve style
In-Reply-To: <20230515125229.44836-2-vsementsov@yandex-team.ru> (Vladimir
 Sementsov-Ogievskiy's message of "Mon, 15 May 2023 15:52:27 +0300")
References: <20230515125229.44836-1-vsementsov@yandex-team.ru>
 <20230515125229.44836-2-vsementsov@yandex-team.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Mon, 15 May 2023 15:00:01 +0200
Message-ID: <87pm71zr5a.fsf@secure.mitica>
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
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru> wrote:
> Fix over-80 lines and missing curly brackets for if-operators, which
> are required by QEMU coding style.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Reviewed-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


