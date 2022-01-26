Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6487C49D425
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 22:11:22 +0100 (CET)
Received: from localhost ([::1]:52566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCpZY-0004d5-AU
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 16:11:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCpSO-0006uG-0c
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:03:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCpSL-0004kU-SH
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 16:03:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643231033;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=XEzvtTOPmEi3O3yLWletDXVNv5WP0dE8Ct3tJZ3cCjI=;
 b=CVdFF8taTofAH+llGc9Dutw7OPwROZ2x1mMd7zd8Vm94e7O8zJ3fIZkpyPwhh9iRnxNZAt
 qan9P2Qd59aORXh0GJs2AnS9gUdWKl2uxNSibJWt2rdZ+p5mkjVzLjRWZ2RYBAbikQMCqE
 M2h4MY2r4mXawtxJ5epdrDOM1cNSgRA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-266-VCgUUvXTNiGlH8xxHCzpsg-1; Wed, 26 Jan 2022 16:03:51 -0500
X-MC-Unique: VCgUUvXTNiGlH8xxHCzpsg-1
Received: by mail-wm1-f71.google.com with SMTP id
 o194-20020a1ca5cb000000b00350b177fb22so2344903wme.3
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 13:03:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=XEzvtTOPmEi3O3yLWletDXVNv5WP0dE8Ct3tJZ3cCjI=;
 b=KiQu7pJBAZT9Q9jqmV68NEKXBxRPbYWj7lyPEP7tO+YSOzHdR5S4dWKRrquW/sdqJN
 wRxSIpJBncQ62AMSEjJjY2DBkIjqPwrE4L+8FZGA5Xs0QYptqMIIgUwWNRGbYT/R8Pp/
 GPCY5B8tQcBZ/hoAKW7RylrgGgLbjey3gDzAwOaAACP/mh1pTLeN4T+zo4g9ozioIu/g
 ERSU+WzTrGZtfT1gLDEDlURpkA+JrFl0aeE4Zt8b0K1syD7Q4j1015k5141AsQaahri5
 ORlgmcYaNOu2boSbIqmxfjBD29/a+TKZG0wwaxhwre6Ox9BTcQ5FCfuF3aw0BKhrXlwC
 gHYg==
X-Gm-Message-State: AOAM531LAZJ3B1tsE3ZTlTeO8iFUc5fMWy3Fysl3Zg5p280c+L3te+o3
 +XjDBO0YJkG7J0qS2RLks43qfmehqTxjS/GPB2AIOGESl7mEkHkmJn/sGQ2N5eBBUGTruu6KEqF
 FI4SRjxo6b3ZF4e4=
X-Received: by 2002:adf:f141:: with SMTP id y1mr376859wro.104.1643231030500;
 Wed, 26 Jan 2022 13:03:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwo5XWG9PyjfE19aBvRa5ToYKho9N/f1qQBDUVCgy7iTX3BTkpPaed/GbdDshg9SbfkBBR4dQ==
X-Received: by 2002:adf:f141:: with SMTP id y1mr376847wro.104.1643231030310;
 Wed, 26 Jan 2022 13:03:50 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id m6sm364674wrw.54.2022.01.26.13.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 13:03:49 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH 2/7] migration: Don't return for postcopy_chunk_hostpages()
In-Reply-To: <20211207115016.73195-3-peterx@redhat.com> (Peter Xu's message of
 "Tue, 7 Dec 2021 19:50:11 +0800")
References: <20211207115016.73195-1-peterx@redhat.com>
 <20211207115016.73195-3-peterx@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Wed, 26 Jan 2022 22:03:49 +0100
Message-ID: <874k5qnr9m.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter Xu <peterx@redhat.com> wrote:
> It always return zero, because it just can't go wrong so far.  Simplify the
> code with no functional change.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>

queued


