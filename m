Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F556F1E23
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 20:40:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psSzA-0005Xu-Jc; Fri, 28 Apr 2023 14:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSz7-0005X0-EO
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:38:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psSz4-0004dD-CB
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 14:38:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682707097;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=LOGh0lUFieWpa9Yv+vluGGk9yebSZ8Z9UOm8QhfrmBg=;
 b=AnoYeJcJ0L25ePQ49/zE7HJLH3m8I2Dp2CjN1ZFidhuD+CaU//H7dklxWSyQ+F+UqUAeOo
 fRBwYr1zyX2ckN7w7VKFVYKYTjEdX0JRx4kUustag+HHA8GrjVgPVqLIG+wuOEbRcPiAOl
 xen5mBsMjur4UqUL2rT1TD14drMVn0I=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-13-j5k1VBXXPXqYynqNBKElZg-1; Fri, 28 Apr 2023 14:38:15 -0400
X-MC-Unique: j5k1VBXXPXqYynqNBKElZg-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-304991654ceso21509f8f.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 11:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682707094; x=1685299094;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LOGh0lUFieWpa9Yv+vluGGk9yebSZ8Z9UOm8QhfrmBg=;
 b=Wg7HZoRXh2hz+3ca19zYCvw/Z6Kdrxgoyq9XV2rBdj3ysDWvRHm4T1fu7MZ9LkchlP
 x4YrmQfLTfEp4PaEnCHE624wqMuHeCQm9vIqbrm352XZMdKZaj9vbXHICSs6LkFrAGLE
 IqtkmkEGuQcA8njHPyNF7HWf5ULEGMy+vRunjV4mZH4z89T6AC6bUQ5k77KDV/U+g6MW
 Boe8SxjJ0ua2StjDtZDiXtfQsKCUo2QYoAshhO5VzA/HDADezma9VkOYVfSVc9KzeGdA
 WUXyiIywzo4jrloIY6p4zJIs4D5y8dc+Pgjy+LOl9HUNQ25XNnPQGO/uiwTUkkFbEFk2
 Ogwg==
X-Gm-Message-State: AC+VfDztZqQMMZwuI4myT8R4B4tMO3rR53o/NA/ewf5jnJTXexj2TqY3
 8+toJmAfUy3m35nYIAFUwVitlvD1IkcfniXWD/JOHF/DrwncRvJZxMEUHQ0hLsR074u62PNUUHS
 xm9r90tzbIHZLLGc=
X-Received: by 2002:adf:f346:0:b0:2ef:399c:1051 with SMTP id
 e6-20020adff346000000b002ef399c1051mr4788424wrp.20.1682707094317; 
 Fri, 28 Apr 2023 11:38:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6oAfylp749XPph8PoPOkhh/9V6RpnMGJ7TsACxelbOAGlT+Ymq1YM9ojgpiVtbswR+cOHWOA==
X-Received: by 2002:adf:f346:0:b0:2ef:399c:1051 with SMTP id
 e6-20020adff346000000b002ef399c1051mr4788417wrp.20.1682707093950; 
 Fri, 28 Apr 2023 11:38:13 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 u6-20020adff886000000b002f7780eee10sm21757591wrp.59.2023.04.28.11.38.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 11:38:13 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org,  QEMU Trivial <qemu-trivial@nongnu.org>,  Hyman
 Huang <huangy81@chinatelecom.cn>,  Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH] softmmu: Tidy dirtylimit_dirty_ring_full_time
In-Reply-To: <be8ccc72-0dfb-ca33-e309-27d51d96a623@redhat.com> (Thomas Huth's
 message of "Fri, 28 Apr 2023 12:57:05 +0200")
References: <20230428103448.3811208-1-richard.henderson@linaro.org>
 <be8ccc72-0dfb-ca33-e309-27d51d96a623@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 20:38:12 +0200
Message-ID: <87jzxv6eej.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

Thomas Huth <thuth@redhat.com> wrote:
> On 28/04/2023 12.34, Richard Henderson wrote:
>> Drop inline marker: let compiler decide.
>> Change return type to uint64_t: this matches the computation in the
>> return statement and the local variable assignment in the caller.
>> Rename local to dirty_ring_size_MB to fix typo.
>> Simplify conversion to MiB via qemu_target_page_bits and right shift.
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Juan Quintela <quintela@redhat.com>

Not that I expect the amount of bytes in one machine to not fit in
64bit, but good change.

About the signesdness of variables, I really hate it, specially that
compiler not help here where arguments, operands and assignment place is
unsigned.  Sniff.


