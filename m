Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED036F7181
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:50:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoU-000785-R3; Thu, 04 May 2023 13:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puaBP-0000JU-Gm
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:43:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1puaBN-0004Kx-W7
 for qemu-devel@nongnu.org; Thu, 04 May 2023 10:43:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683211424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JF8Ke4n1Zn7eZ87CIdotqQX9hJOYkAVIQGjWjalqiZs=;
 b=abxILYZks2pdLdxxs2QLfrwkFO6b0Rzjy6+CQphFY7wZHXWPFv53nZd4Nt945aloP2YUD1
 kEQHo5d58MtB2Y93VwR7P9NyQshyMXMIBFOyEjFKEAGHZkyADKcdSz6aOfUNH5KlUckygS
 kGo3+M1WwxD+ZZ8+h10hhIyiZz2L3i4=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-NUNHphM2Orq02YX9ysapQg-1; Thu, 04 May 2023 10:43:42 -0400
X-MC-Unique: NUNHphM2Orq02YX9ysapQg-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-74e0dd4e504so1099585a.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 07:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683211422; x=1685803422;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JF8Ke4n1Zn7eZ87CIdotqQX9hJOYkAVIQGjWjalqiZs=;
 b=OavQqh3VsRCqHCwHgr+p7cbfruK7aAEkzrb+OXcs/m5GVd1Ty8i0XhdYOLrheLf2P7
 eJNp0LQk4rgR7oesKwzW1YjzjEN3iv+m31Psk0kyFj9FSyeLtw0gvXg+187IOjxPiEFr
 0OqvCxcG0iZVG429mFzjNUZX/DfFyvkb8/HLNQIbdZGWwe7kcOmQ79Iotbo1NVplPaM/
 HFUEqmP0c0hm2He/LZq/EujRGLkO/bHLLjlavfe+aYgRxRxm9/NE943Ra5T6vXdk4KJ0
 F473cGbks62OTuETc1wYXuxRRPHK1ft15FmVFa+1itOh4NyczgCHq74/JVuIsGmjEsJA
 ZuqA==
X-Gm-Message-State: AC+VfDwDENpUTuYcAcbODz1h3OmUyc1DD/3zeSoRDES357q+MmieM3/m
 qBUyu6mqgDv8aXGmYH3+sDIak+TrlIxOtbRYeKAqigyzi0IbFti5EXNKNgLgCAl41eZQN5jF9an
 DiXqvphuvLiK/ASc=
X-Received: by 2002:a05:622a:c1:b0:3c0:40c3:b8fd with SMTP id
 p1-20020a05622a00c100b003c040c3b8fdmr16031571qtw.6.1683211422402; 
 Thu, 04 May 2023 07:43:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5/7wnkwT7WX7rrIUEnu2mi3MuNnrfO21uoXmG7RphU4D6paoBdPQwRiRMXCXG+hr0m4Wf9ew==
X-Received: by 2002:a05:622a:c1:b0:3c0:40c3:b8fd with SMTP id
 p1-20020a05622a00c100b003c040c3b8fdmr16031547qtw.6.1683211422152; 
 Thu, 04 May 2023 07:43:42 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 a19-20020ac85b93000000b003e1cf472b17sm12432883qta.97.2023.05.04.07.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 07:43:41 -0700 (PDT)
Date: Thu, 4 May 2023 10:43:35 -0400
From: Peter Xu <peterx@redhat.com>
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Fam Zheng <fam@euphon.net>
Subject: Re: [PATCH 9/9] qemu-file: Account for rate_limit usage on
 qemu_fflush()
Message-ID: <ZFPElx61bhgRf87L@x1n>
References: <20230504113841.23130-1-quintela@redhat.com>
 <20230504113841.23130-10-quintela@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230504113841.23130-10-quintela@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
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

On Thu, May 04, 2023 at 01:38:41PM +0200, Juan Quintela wrote:
> That is the moment we know we have transferred something.
> 
> Signed-off-by: Juan Quintela <quintela@redhat.com>

There'll be a slight side effect that qemu_file_rate_limit() can be
triggered later than before because data cached in the qemufile won't be
accounted until flushed.

Two limits here:

- IO_BUF_SIZE==32K, the real buffer
- MAX_IOV_SIZE==64 (I think), the async buffer to put guest page ptrs
  directly, on x86 it's 64*4K=256K

So the impact should be no more than 288KB on x86.  Looks still fine..

Reviewed-by: Peter Xu <peterx@redhat.com>

-- 
Peter Xu


