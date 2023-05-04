Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B3E6F7165
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:45:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoV-00078z-Km; Thu, 04 May 2023 13:32:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puaDP-0000YY-H3
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:45:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puaDO-0004nb-2t
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:45:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683211549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0NvICj7ilUAhFYlBDvg9fXmfxXZyvAVjlCjWLyvNqTY=;
 b=QuhSVpq8zu/8MlJiGm3bShNJtmVu33gQF5MEcK7qV4NPpo3KV24Mgcw5BD7OfFpUoNLUMN
 fogujkfpjjhC9gitvdyquvyDvjyg8PNvde+qduwInc8a7c004J1mM8Gn0mPAiJSqcvuKRF
 J2uTjJnngDbpuhkKX2+IIMh6crYwBQQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-cqRVdFkmNX-ctj15I5OEzA-1; Thu, 04 May 2023 10:45:46 -0400
X-MC-Unique: cqRVdFkmNX-ctj15I5OEzA-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-3edbe09ba35so265941cf.1
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 07:45:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683211545; x=1685803545;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0NvICj7ilUAhFYlBDvg9fXmfxXZyvAVjlCjWLyvNqTY=;
 b=g7IRmOabc90RriWIOIjDFlzrMsKjz+jjUedL/fVoRMNl6WxmY7jxWWehgi6gXlQ3r4
 sE5I7b6oMBNDG1BHJhI4v9gwMBbKM+rv/IuoF1ZJbOPKxbGHuaMlcA8OKmS0v21PdJ/X
 836JgZsxZMW2gHyqFO373itC33FMHJmDZwdXsyVymprCQlYO1XlEC9mTO0hm1olQsHI4
 MV5zKJQ1PzTuttlNjyK3N3d3gv/FZeuC3U5HSsaoZjuP7fPslGtAzymtRiWnkTIosaOM
 QaC+1yvZiZ8126GMLXmdnCNvv69HLb9dFxiDYFoT4tXkQr22OIsoYGUO1KRJPWxsPTMW
 U51Q==
X-Gm-Message-State: AC+VfDzO8FL8HarSYfunb2eeBoU7b16+0sxQYjEK9qFPkqfKcze4PfAc
 kYUbRugzAcQdteTjZ9hHU1EzDKRT8A1CBKFxD63UHOL3loPFgfcdMZrabI1fgK187HZz/eebCdU
 fRnr2sU+BcrLim0s=
X-Received: by 2002:a05:622a:1819:b0:3ef:168:7833 with SMTP id
 t25-20020a05622a181900b003ef01687833mr15197826qtc.5.1683211545658; 
 Thu, 04 May 2023 07:45:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ntjrADwzvqj3gSU2vQdYgWbrPWBN7fBZ9lKfIRHJii/dliSn5mPOnX9IP+COaYwhXpYOdfw==
X-Received: by 2002:a05:622a:1819:b0:3ef:168:7833 with SMTP id
 t25-20020a05622a181900b003ef01687833mr15197793qtc.5.1683211545351; 
 Thu, 04 May 2023 07:45:45 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 dt9-20020a05620a478900b0074df7857e72sm11547641qkb.34.2023.05.04.07.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 07:45:44 -0700 (PDT)
Date: Thu, 4 May 2023 10:45:43 -0400
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 0/9] QEMU file cleanups
Message-ID: <ZFPFF4MB1j5wNnxe@x1n>
References: <20230504113841.23130-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230504113841.23130-1-quintela@redhat.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, May 04, 2023 at 01:38:32PM +0200, Juan Quintela wrote:
> - convince and review code to see that everything is uint64_t.

One general question to patches regarding this - what's the major benefit
of using uint64_t?

It doubles the possible numbers to hold, but it's already 64bits so I don't
think it matters a lot.  The thing is we're removing some code trying to
detect negative which seems to be still helpful to detect e.g. overflows
(even though I don't think it'll happen).  I just still think it's good to
know when overflow happens, and not sure what I missed on benefits of using
unsigned here.

I've reviewed all the rest patches and all look good here.

Thanks,

-- 
Peter Xu


