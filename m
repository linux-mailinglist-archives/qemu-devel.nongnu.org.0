Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C62042E635
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 03:38:59 +0200 (CEST)
Received: from localhost ([::1]:44188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbCBW-0006Fg-Cz
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 21:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mbCA9-0005YA-Em
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 21:37:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mbCA7-0006OX-Ns
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 21:37:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634261850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/uss8EGvkXr7tK7KFeqMaNmdCs3SKS0RFD4Hh+RVy5g=;
 b=FxoGMRDiIaq7kQaz7fnXVti1dkj7be5WuPJwn+LUbO5a0kaBeNYQGt6qNqqLHghQ2pO3BY
 DMwSPEZWkG16+nYLvTR3ynhJzXnPgX9Hvuer8qGDSCBkG+dfmqwzO7sxlR4ho6n/4UEWAl
 VymQVH8YDs6/g/xWRSRYVrwmY5mfK5Y=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-BNM20uB9OBehgUvJEShZpw-1; Thu, 14 Oct 2021 21:37:30 -0400
X-MC-Unique: BNM20uB9OBehgUvJEShZpw-1
Received: by mail-pf1-f197.google.com with SMTP id
 2-20020aa79102000000b0044c216dd8ecso4413116pfh.18
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 18:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/uss8EGvkXr7tK7KFeqMaNmdCs3SKS0RFD4Hh+RVy5g=;
 b=lYwwOv+l4xxdfrVCVW8ZpLR7455Qy/VHC+7rMh+sIouMUCMl3X4Nj/FqXKxa5yVJZS
 e7DuQTGvtvr1CeBXFKHjQCH/dPU4y3ep0u6WMpEKEq5o+fdku5JkW+ystRHb95ifp36q
 Dzj8ytfxEbvS7asKLEwtfIgFKnlbgnHRzo2oXnMVjOcfEZ1vVe52ZrY7MvEGjr/OPrPT
 MotEN/ubHE34YszbmiMQWwRscwezYFuGHMxzpUQitnvtEJjfwwxUotgTi6EmY17A7kWO
 vPAW8hctEzP9iPLGzcvLYvfpvJIjq27+l+asVBo881lbtH4lMuRzFspUwRfdclYXkQQN
 r4hA==
X-Gm-Message-State: AOAM5331NZgGNTST1sz+NLB1cC3XwWQnjHShF4RM0vV0RmO1PGRGLk2K
 kN5HG2nDeWfXzxdtEaHf56ay/oqooaVdDzd3asn7RLg4gN4dBREEDI5/c1LNFpbXq+8NtWlNbGz
 bJ5/VO2Uu6UqSDdcI3Zuiy85Yn4dw3mikhWjTCxJ7H2PIKQHAbHzGJcBAwrxIZMmj
X-Received: by 2002:aa7:814f:0:b0:44d:626:8b96 with SMTP id
 d15-20020aa7814f000000b0044d06268b96mr8944608pfn.65.1634261848371; 
 Thu, 14 Oct 2021 18:37:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHyN+Y8g+EC0195HwcsHzdK5dvaqtQtI+dJiuUX3t5dNxRyun24n3lvmpIrz0alw2j44OOzw==
X-Received: by 2002:aa7:814f:0:b0:44d:626:8b96 with SMTP id
 d15-20020aa7814f000000b0044d06268b96mr8944579pfn.65.1634261847949; 
 Thu, 14 Oct 2021 18:37:27 -0700 (PDT)
Received: from t490s ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id v20sm3776302pff.171.2021.10.14.18.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 18:37:27 -0700 (PDT)
Date: Fri, 15 Oct 2021 09:37:22 +0800
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH v2 0/2] Makefile: A few fixes to tag generation
Message-ID: <YWjbUjmTg20xNGb4@t490s>
References: <20210804132328.41353-1-peterx@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210804132328.41353-1-peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 04, 2021 at 09:23:26AM -0400, Peter Xu wrote:
> I didn't squash patch 1 because they fix different things at different places
> (patch 1 removes the "meson" dir warning on master branch already for gtags).
> Patch 2 is the same as posted previous on the list.
> 
> Please have a look, thanks.

Ping again..  comments welcomed..

-- 
Peter Xu


