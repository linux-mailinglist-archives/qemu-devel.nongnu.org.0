Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 216CD6F1C6B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 18:17:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psQlV-0001Or-A4; Fri, 28 Apr 2023 12:16:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psQlQ-0001O0-F8
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1psQlO-0007w2-Fy
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:16:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682698559;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=KNY7vgclrdArVgchjIx/mP7ef3RSRh/tiZaXyDIjbqg=;
 b=f7Ei7ddMi9KqrfuMv3StztzqqMChXjzQrwFNX4Br4bkP2E7Q73gz4bjLSZ5nUn9Nnz/qrg
 QhhxX8eIaT09qZ8DTDXkr/jMMU0te3e6tg6v36bk9y7+0RL3kkfSR5X/GL7zjSK0LMVg3p
 McezaBp8dpiDgqq0ecr/n3r0ZTJnMw0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-290-0QWAEjZjNF-t0tJ4S7-m0Q-1; Fri, 28 Apr 2023 12:15:55 -0400
X-MC-Unique: 0QWAEjZjNF-t0tJ4S7-m0Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-2ffee43dac5so3728880f8f.2
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 09:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682698554; x=1685290554;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KNY7vgclrdArVgchjIx/mP7ef3RSRh/tiZaXyDIjbqg=;
 b=T4OAdt2NuFBCRmv/ad+D0hzAlmv6yZ4mgQC5aCmr/7YzZwxIUUrrwnWAwPsSql9YWs
 Bg9Vd4uyIHsMXZsnin28af4PIeQFij0QQbnda8y/wx7rzsTYvZmXGfY+mRgeGfbLKQ+6
 JfUr/P6OvRhWkOOkWTUKTwxmqoxMYmJlaXQFOzmjwnoaP7Lty1I/8JmEPPFGyd85AG0N
 tUjNCV3fIcnkDDo7/toXtpujZYIbP6k7IbSrGERb0p2eGbvUNjqlHBvX6TnKNM68vWP8
 iFqSZo7QNQxcT/a1/imnd4ayJx797VGe9qA55xEOoPo5iCVCoylyEYLQrPM7l3YVH2MS
 VHxg==
X-Gm-Message-State: AC+VfDzCC4qKHn+QiKIPtOv7nhhHzj8WvwxGoZ8IgYHp8n7dGjcSw0ty
 B09DRm1gt42j52Zt87vDNRREuyGqklGLfcPXrMLPdEf7wiNche9PtEQRVNictl22uC6pVUvmXeq
 a/C2ZOOYkC5/FkJ0=
X-Received: by 2002:a5d:5968:0:b0:2ef:bada:2f25 with SMTP id
 e40-20020a5d5968000000b002efbada2f25mr4269974wri.67.1682698554593; 
 Fri, 28 Apr 2023 09:15:54 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5L6wvRCehHe8apYJU4tROtO+QCinLtRvkTpw18ttm1e5T8SE566GbYS0EB1nYS2rpjHv9yRg==
X-Received: by 2002:a5d:5968:0:b0:2ef:bada:2f25 with SMTP id
 e40-20020a5d5968000000b002efbada2f25mr4269963wri.67.1682698554330; 
 Fri, 28 Apr 2023 09:15:54 -0700 (PDT)
Received: from redhat.com (static-213-163-6-89.ipcom.comunitel.net.
 [89.6.163.213]) by smtp.gmail.com with ESMTPSA id
 x2-20020a5d60c2000000b002de9a0b0a20sm21336761wrt.113.2023.04.28.09.15.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 09:15:53 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Lukas Straub <lukasstraub2@web.de>
Cc: qemu-devel <qemu-devel@nongnu.org>,  Peter Xu <peterx@redhat.com>,
 Thomas Huth <thuth@redhat.com>,  Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v2 10/13] ram.c: Remove whitespace (squash with previous
 patch)
In-Reply-To: <cdb82473b02794f867efd115f1bd2c7a1e392a02.1681983401.git.lukasstraub2@web.de>
 (Lukas Straub's message of "Thu, 20 Apr 2023 11:48:24 +0200")
References: <cover.1681983401.git.lukasstraub2@web.de>
 <cdb82473b02794f867efd115f1bd2c7a1e392a02.1681983401.git.lukasstraub2@web.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Fri, 28 Apr 2023 18:15:52 +0200
Message-ID: <875y9gasp3.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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

Lukas Straub <lukasstraub2@web.de> wrote:
> Signed-off-by: Lukas Straub <lukasstraub2@web.de>
obviously skipped


