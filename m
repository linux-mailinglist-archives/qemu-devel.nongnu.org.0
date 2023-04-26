Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B34546EF866
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 18:27:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prhyX-0007nR-5C; Wed, 26 Apr 2023 12:26:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prhyT-0007n1-M7
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:26:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1prhyR-0006yh-7a
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 12:26:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682526390;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=3WfIIKBOFCEatKUqc6rohHgEVZCDPvzi23RmqmwWc3c=;
 b=CbLeohyqL4eAxP7Aw2DC3iG+Qc3efB0USpYUVMG+w98Kto/Sa+bF+5ZqISHlPmXqHC7YIT
 DkQTMq3kFTvHbVS7VULA92HbU919oces6Wvl1L1xMjXmfWHTiuV/wNgkrq0MJJnIVCtVH5
 D7PrQFpu9Phbt1fwhUMtkILSjsqcLB0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-oKp2dlgDPOmmbt_n5d_Rgw-1; Wed, 26 Apr 2023 12:26:21 -0400
X-MC-Unique: oKp2dlgDPOmmbt_n5d_Rgw-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f080f534acso46101165e9.0
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 09:26:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682526379; x=1685118379;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3WfIIKBOFCEatKUqc6rohHgEVZCDPvzi23RmqmwWc3c=;
 b=F55CRYDRv/T4qVrW/QgkRm4L2G6YGQc7mwKA4hrFl6DHh0QNpqm/NOOz/PKxa3oRcp
 GO76bJ/EnsbzgZZPwS2voH5XIaYtxrau+rXVR+K2RF5jbdbH9rE6XJNWXQxN+xaFeftC
 uD7/5aYJvQqrtT4LHTDQBFj3Erm5xkEcfSicg8SrT1PMAB3aIl+Wvth08oA9oHZon1dv
 iQ+V4C1RthaZgIZF6XWCbNeD6EbZ7Adf98JfQHh9BGCxLVPej8Z9oswZR7xIdJSCXP1D
 TsU+H6a3muPj7Z1ZSZOrHPXUn93jjz/0u8RDLBiZ5SjzT7WprdewF2bLVX27JP91Rwqp
 qP3Q==
X-Gm-Message-State: AAQBX9fhkCueeluFk6m3znhHjNXlSxMMKGr34We5PXHLiS929Gd8loIk
 H6M5Rd7TUb4DwBT7qN5utekwBLzLs2pbWRr4ZydvTTkrgvDeF05FH1YNFeYjU2nUPhtH0thJQw+
 OkgDok3EkeIyHJonCxsL57nXN7fG2
X-Received: by 2002:a1c:7902:0:b0:3ed:fc8c:f197 with SMTP id
 l2-20020a1c7902000000b003edfc8cf197mr12774619wme.29.1682526378966; 
 Wed, 26 Apr 2023 09:26:18 -0700 (PDT)
X-Google-Smtp-Source: AKy350bA7bYD97gGwx9hE17FubZrCOHLM9jroMqV8imiNz2bza+I1iVDJSd+NdFmwmGJZKlxvSeFrA==
X-Received: by 2002:a1c:7902:0:b0:3ed:fc8c:f197 with SMTP id
 l2-20020a1c7902000000b003edfc8cf197mr12774603wme.29.1682526378576; 
 Wed, 26 Apr 2023 09:26:18 -0700 (PDT)
Received: from redhat.com (static-214-39-62-95.ipcom.comunitel.net.
 [95.62.39.214]) by smtp.gmail.com with ESMTPSA id
 e26-20020a05600c219a00b003f180d5b145sm18504427wme.40.2023.04.26.09.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 09:26:18 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  Daniel P . =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>
Subject: Re: [PATCH v3] migration: Allow postcopy_ram_supported_by_host() to
 report err
In-Reply-To: <20230426011514.1972344-1-peterx@redhat.com> (Peter Xu's message
 of "Tue, 25 Apr 2023 21:15:14 -0400")
References: <20230426011514.1972344-1-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 26 Apr 2023 18:26:17 +0200
Message-ID: <87h6t2fw46.fsf@secure.mitica>
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

Peter Xu <peterx@redhat.com> wrote:
> Instead of print it to STDERR, bring the error upwards so that it can be
> reported via QMP responses.
>
> E.g.:
>
> { "execute": "migrate-set-capabilities" ,
>   "arguments": { "capabilities":
>   [ { "capability": "postcopy-ram", "state": true } ] } }
>
> { "error":
>   { "class": "GenericError",
>     "desc": "Postcopy is not supported: Host backend files need to be TMPFS
>     or HUGETLBFS only" } }
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued.


