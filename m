Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BFA3552077
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:21:42 +0200 (CEST)
Received: from localhost ([::1]:43214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3JDh-00085o-3w
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3J9H-0002mS-8x
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:17:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3J9F-0000sz-Kn
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655738225;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=riJsTGdcQRryCxMGk4g1wv1oVIHZCK7gmmzC7lZdS8Q=;
 b=OPO2UROF0jNvk01jQ66DFEbW/yzukyrKg8qmhEbztPXWY44SRNOAln0+y206CAhUA2/AIC
 zGUlMCxpbA1foIS7jn/vMwikHC2bvdWbVccxxkNZUHZBXqNtDOqnV0W9FVXsfvb0PboYTR
 PGXIU+MWU+8/ufT10j3oCtgvFj+4rQg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-658-DWW0gPtDOxyEsB6kbFcaRg-1; Mon, 20 Jun 2022 11:17:03 -0400
X-MC-Unique: DWW0gPtDOxyEsB6kbFcaRg-1
Received: by mail-wm1-f69.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so5153121wmj.0
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:17:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=riJsTGdcQRryCxMGk4g1wv1oVIHZCK7gmmzC7lZdS8Q=;
 b=3EoO1wtXZW3zMkef5pEM7dSTFqi3TAFlxsilbmZr1pcM1H9mqcbUhTBoCjeDpJLEcd
 0QpEUnqp2rpteadNEr11dj5dIx4CaT1ySD9hWOlg7LgL2wfvwVseWU4iISvZXBSkhCmt
 b+2MIi0zR6IA2Vj+oB5s/sK7u2jRWCYUtZJut0qc3o4zlAn86afAzLtBILq/WA3BzC19
 GeNFsoy7OUj6ZXpOEIpA8yF/oQr3ItoLSWNA+M4RpvYTQ0UwepvoDn9go9UADHqm1sB9
 4spw0M/Mtv9m1ZHKX/uQC53Tgn/+HJSozWJJITbArE/o6fdTaajzC+CLEOWCNnN9XZYM
 Y4iw==
X-Gm-Message-State: AJIora+ztPN8hYXAVrfEtqLl2IVuiif0t3M8JQu3yxh2MT6jLw2xFpCZ
 EAPR5Ckndzf/VXmy/rN87FINK59tvINNaTdsdB73GGlQm88jxvrzfnKVIs9p9NO1WiR7FRludrm
 +ItCSax/ZAtNMmLM=
X-Received: by 2002:a5d:526b:0:b0:21a:3c94:cf36 with SMTP id
 l11-20020a5d526b000000b0021a3c94cf36mr18788606wrc.535.1655738222456; 
 Mon, 20 Jun 2022 08:17:02 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tr9rXFH2ek+fZRfwCQNThVv9okKcGpQhSOYzM+r7gfSA2HUqMVlhPdwTfHZgRuSr6rGJ9F3A==
X-Received: by 2002:a5d:526b:0:b0:21a:3c94:cf36 with SMTP id
 l11-20020a5d526b000000b0021a3c94cf36mr18788578wrc.535.1655738222231; 
 Mon, 20 Jun 2022 08:17:02 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 z11-20020a5d640b000000b0021b8a3528bcsm5644731wru.56.2022.06.20.08.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:17:01 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 09/21] migration: introduce a QIOChannel impl for
 BlockDriverState VMState
In-Reply-To: <20220620110205.1357829-10-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:01:53
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-10-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 17:17:01 +0200
Message-ID: <87czf32wlu.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> Introduce a QIOChannelBlock class that exposes the BlockDriverState
> VMState region for I/O.
>
> This is kept in the migration/ directory rather than io/, to avoid
> a mutual dependancy between block/ <-> io/ directories. Also the
> VMState should only be used by the migration code.
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


