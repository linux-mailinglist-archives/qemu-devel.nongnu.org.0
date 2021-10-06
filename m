Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0A1423981
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 10:14:15 +0200 (CEST)
Received: from localhost ([::1]:36712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mY245-0007kk-PP
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 04:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mY22a-00068c-7p
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:12:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mY22Y-0007Nc-QY
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 04:12:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633507957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HnGTjAZRaen9r2AJg6UG5NHDvNf7qVOPyp55+zNHlNQ=;
 b=XDO9DtAV+yUPE+vqWzOzWWiezLKrNMpLYnn4Hfm/s5LsOUGaLxEjfk1Qfblte0mLGFkmV3
 AlLqbQFlzpA1OHWFMyMLWs0ibHzfF1b0kZ5kw5xKwcDuvkJ0jCJr7m46sIMhnFcrFDFXRn
 LL7z5hNuXPeFsXrIQfPHeKARlSxx76k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-f7MSUs6uPa6CbtCVPEszmg-1; Wed, 06 Oct 2021 04:12:36 -0400
X-MC-Unique: f7MSUs6uPa6CbtCVPEszmg-1
Received: by mail-wr1-f71.google.com with SMTP id
 e12-20020a056000178c00b001606927de88so1354799wrg.10
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 01:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HnGTjAZRaen9r2AJg6UG5NHDvNf7qVOPyp55+zNHlNQ=;
 b=gqf4fN4UPiMuVRzVbKXqQGhewFyUrMYk6Nj5RNa7EjBpy9/sYq+j3rqbyHS/xBMUl/
 PMtXx7mAdT9dWWqZNTVNzCIeBZqKz53WgRxoKZdvpB27b3KUUgbZQseYzXTGndKxDSeY
 +B1JZEJDDGPLigoOlMIT76rD3r0f3cGHUXdT+ZVItaJK/tE5rzbad7iVwerry2PT0MhG
 xPM2BiK1jfn2UvtLXtUb2TiXHkTbfbcWzO1bIDOLxAhQReboJ7aTFoqGvkz5MAbuog5v
 CyFC7epteC4svdm0xT75E4arR39FT+nK/KLvY8FgSh35weqM4Bn675/7VPkRMeSHjPjR
 4f1g==
X-Gm-Message-State: AOAM533ITqY0eNUMHvTIviPgoBLgJkzCsZ7hgfGJJwg6nopxjnm0R2NZ
 9jwtRIc42RdrOyMLCa6qlezm9bhs/5weXCIE4lSUHEtgWzBV3UtEL1RppFrJr+Vvl+QIGDWAB6C
 dCEXdJAWGb9JtilM=
X-Received: by 2002:a1c:f008:: with SMTP id a8mr8387257wmb.140.1633507955159; 
 Wed, 06 Oct 2021 01:12:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymZh4G98oG7y6Nt+H35D6n/wffuaKMR4t4jXmrLfKTJ77aR5Ac8c0vu5dtIVnN6FmFtODWLA==
X-Received: by 2002:a1c:f008:: with SMTP id a8mr8387237wmb.140.1633507954949; 
 Wed, 06 Oct 2021 01:12:34 -0700 (PDT)
Received: from redhat.com ([188.120.128.46])
 by smtp.gmail.com with ESMTPSA id l21sm5179274wmg.18.2021.10.06.01.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 01:12:34 -0700 (PDT)
Date: Wed, 6 Oct 2021 04:12:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Subject: Re: [PATCH v6 02/10] ACPI ERST: specification for ERST support
Message-ID: <20211006041132-mutt-send-email-mst@kernel.org>
References: <1628202639-16361-1-git-send-email-eric.devolder@oracle.com>
 <1628202639-16361-3-git-send-email-eric.devolder@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1628202639-16361-3-git-send-email-eric.devolder@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: ehabkost@redhat.com, konrad.wilk@oracle.com, qemu-devel@nongnu.org,
 pbonzini@redhat.com, imammedo@redhat.com, boris.ostrovsky@oracle.com,
 rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 05, 2021 at 06:30:31PM -0400, Eric DeVolder wrote:
> Information on the implementation of the ACPI ERST support.
> 
> Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> ---
>  docs/specs/acpi_erst.txt | 147 +++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 147 insertions(+)
>  create mode 100644 docs/specs/acpi_erst.txt

It's probably a good idea to have new documents in the rst
format.

-- 
MST


