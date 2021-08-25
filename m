Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4473F70DF
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 10:05:52 +0200 (CEST)
Received: from localhost ([::1]:47698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mInux-00025x-5d
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 04:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mInu6-0001Ml-R9
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 04:04:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22297)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mInu2-00040F-K5
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 04:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629878693;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=FmNFWAKRSJUJ+txc3kt5tQrLvbdY//tRXjcFJ0dRfRc=;
 b=Q0TPXMRO59rsMHix7JtOGvhhYQ74feFbGzb2l1NiM0fz0ICrwIZ+9KqaQ+PE6VUCc6js03
 5s5N1l6AuB60ASJb7b8QdTtJ1LYiGfCyiD3B4jXYFCNcpDhZonBFl+ERuihrPVeWbCKpSu
 KYc0O2Ml+JsrsSIvXAIV8IKhZQLTEHo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-_bqSVETSP169WmNQ3A7gqA-1; Wed, 25 Aug 2021 04:04:51 -0400
X-MC-Unique: _bqSVETSP169WmNQ3A7gqA-1
Received: by mail-wr1-f71.google.com with SMTP id
 b7-20020a5d4d87000000b001575d1053d2so1530001wru.23
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 01:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=FmNFWAKRSJUJ+txc3kt5tQrLvbdY//tRXjcFJ0dRfRc=;
 b=accm+Ov0FxfZh+aDWzvRndCXlDZ+u+dBY3+PUUV8I1NJB6RZvDcxO+YOYKPcDec0TR
 dcJHrpMwnosZ3f/ld5h7xkUJ6kgDFUP/A8bxjvnhntvqgvzRKW/xK5G9ObP46B8PtkwX
 fl9mJ46YyGESqlcbyTeBEaupvqwhGX+JpEHX3jnaLG5ZQHy+5FWsOCq6308MQzodM6Ts
 OGcyPJOu5oWk29SLUcj/0Nr2XKz4eF8d9fpAuPKsqa2wCY2rr/x/fq6m7C/MtaM57Quk
 4utuxgww7fOqJsEtwg8um7qf1WsyWrF7E2YSPTCslobszqikWoys4ewJV9Z30vz87W7i
 dvNg==
X-Gm-Message-State: AOAM533l8cSzT/t3rL2+WtCzoNSLs8SgHIr16gHYUq7du+Fubzw10oyD
 rRQjwDJ4sbf0EpbXbwkoVB0nMi00KSp/rHoVgAP/Uwc4qBrnzRgDh1LzNBTxuF8QdcFp0vUa6Zq
 2lAcn0/SYDXo55z0=
X-Received: by 2002:a1c:3945:: with SMTP id g66mr740070wma.49.1629878690729;
 Wed, 25 Aug 2021 01:04:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzglmw//xtjnF9Vjpi/jOGMBatni1ODw4n7CkA3gOCtro+GZFfDmO8DCgW7LbV6/dbbsB7vbQ==
X-Received: by 2002:a1c:3945:: with SMTP id g66mr740047wma.49.1629878690514;
 Wed, 25 Aug 2021 01:04:50 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id m16sm4444287wmq.8.2021.08.25.01.04.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 01:04:50 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 1/2] migration: Add migrate_add_blocker_internal()
In-Reply-To: <20210824152721.79747-2-peterx@redhat.com> (Peter Xu's message of
 "Tue, 24 Aug 2021 11:27:20 -0400")
References: <20210824152721.79747-1-peterx@redhat.com>
 <20210824152721.79747-2-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 25 Aug 2021 10:04:49 +0200
Message-ID: <87fsuy54ri.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) DKIMWL_WL_HIGH=-0.747, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Andrew Jones <drjones@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> An internal version that removes -only-migratable implications.  It can be used
> for temporary migration blockers like dump-guest-memory.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


