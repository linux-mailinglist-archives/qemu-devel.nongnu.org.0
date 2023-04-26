Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8306EF875
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 18:31:15 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pri2W-0000i4-Kw; Wed, 26 Apr 2023 12:30:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pri2G-0000fe-GE
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:30:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pri2E-0007hH-St
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:30:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682526626;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=oBOeJVdJ36cd61nHknLsZrDGYnyW5doe2Fso26eT0zQ=;
 b=NJEjs8WkcUnQYmMzJ6XeTHClyASGxGjYUBF4WFPxITC/qrJEx+D//szNlDe1jW76unekx0
 It5vLT31I9UA5UWWz+pIR3p0nlZjzznghzOIFWVbW/V6BziKyNVwkEYoOZ7dh9lJWs86zB
 77NnKJtW7V4q2dVu7e2iflOHJKUEGkE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-tgX73bC2Pwave7ElUtC70g-1; Wed, 26 Apr 2023 12:30:24 -0400
X-MC-Unique: tgX73bC2Pwave7ElUtC70g-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f080f46fb1so28165595e9.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 09:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682526623; x=1685118623;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oBOeJVdJ36cd61nHknLsZrDGYnyW5doe2Fso26eT0zQ=;
 b=ZLKI4saC1xMjIXjrKifPGmg/oge8JuvcbPwFirbD0oJLqG7yMHotMx2eQODfFw3Qja
 YwSuWUK9h69UA4+E8Cx5913/0K1lPLjoDLy/qDZyFtxl4zKwTqe6lIaqsAqApKLIsEPa
 KJ9h+s/uukrsY5+TWwWxilOdAmWQuFjQNftNehC/FHMIJ2yZ3Wiyrjp/0TGJiLY3d3tC
 vTSSLUf0aJUhyai9XCvgPbtjYIrTUKLXfcNoBRk1JlOBByUgcy4xIP7LOGvqIMg73kqG
 FmMyCxhT9ArVbSVIIkZBxFZgzwr2AG6Agiels8Y6ZSseNMUSJIlTSkCVCTZlIfXj5AJc
 Q7Nw==
X-Gm-Message-State: AAQBX9cV94UhPhcgPjPf7ulODQs4lWVpqtIhnUmq19zb7LTxhHFNjIAz
 a23DMAjAOwznTxqX0LF/KilsrPvU0+2pglhc0Z1icwOw6Mwh6OGbTtkdpq3FHbyAVxq4enL1Wq7
 W1oIvCadMJkJ4MAY=
X-Received: by 2002:adf:dc02:0:b0:2f7:53ff:723c with SMTP id
 t2-20020adfdc02000000b002f753ff723cmr13580119wri.66.1682526623160; 
 Wed, 26 Apr 2023 09:30:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350aw1pqeqk9h+8BuMQwDHcmRoYWh5fuvHvJu+PmNM+dklp8FYINMgTNFs3Xdqn5P2a0bnWGbtw==
X-Received: by 2002:adf:dc02:0:b0:2f7:53ff:723c with SMTP id
 t2-20020adfdc02000000b002f753ff723cmr13580107wri.66.1682526622896; 
 Wed, 26 Apr 2023 09:30:22 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm16263233wrf.36.2023.04.26.09.30.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 09:30:22 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH 2/2] vmstate-static-checker: Recognize "num" field
In-Reply-To: <20230425180544.1815888-3-peterx@redhat.com> (Peter Xu's message
 of "Tue, 25 Apr 2023 14:05:44 -0400")
References: <20230425180544.1815888-1-peterx@redhat.com>
 <20230425180544.1815888-3-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 26 Apr 2023 18:30:21 +0200
Message-ID: <877ctyfvxe.fsf@secure.mitica>
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

Peter Xu <peterx@redhat.com> wrote:
> Recognize this field for VMS_ARRAY typed vmsd fields, then we can do proper
> size matching with previous patch.
>
> Note that this is compatible with old -dump-vmstate output, because when
> "num" is not there we'll still use the old "size" only.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


