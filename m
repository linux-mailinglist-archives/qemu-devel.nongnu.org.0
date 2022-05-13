Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C04526571
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 16:59:17 +0200 (CEST)
Received: from localhost ([::1]:36596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npWl9-0007Qn-No
	for lists+qemu-devel@lfdr.de; Fri, 13 May 2022 10:59:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npWjC-0006Ad-QG
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:57:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npWjA-000074-12
 for qemu-devel@nongnu.org; Fri, 13 May 2022 10:57:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652453831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0qmbe4MtTelnojL18gw9cUFJ7lE7CESwCaW6SloW+yw=;
 b=gwKxsQxBVhGVGmGWxQcDweJ3ShNVge/f+gBoNzZyQGPa9ixh96OKMCP36jYH2swYck2mNg
 UgnrQwKHjTzdDLnxAquQ9q8KJCe32Juha2BWvI2XooR6Nnnumit4RV/QhQR1UXZPyxf4HT
 l0/iUZwPM08EdGyPdYRcL8DLOhBhJv4=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-354-Kn8Gqq_NNNGGJY92vDHHdQ-1; Fri, 13 May 2022 10:57:10 -0400
X-MC-Unique: Kn8Gqq_NNNGGJY92vDHHdQ-1
Received: by mail-il1-f199.google.com with SMTP id
 k6-20020a056e02156600b002cf4afa295bso5317354ilu.8
 for <qemu-devel@nongnu.org>; Fri, 13 May 2022 07:57:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0qmbe4MtTelnojL18gw9cUFJ7lE7CESwCaW6SloW+yw=;
 b=GAkTRXYvy9vD22/NB7N37x2HOgWw18GVmRQfC4dAJlmA+iNWqJ6hE6tJhXrgowoOdY
 HTjAkG+00VsggdRrppRtG18O9qw6pRx6crUQjpJE6gyrBrTRZxhAGKdddA/ckVTLAzdX
 mt93pR0L3eszSj6eLCepENGBsv0gsgtJ27WCS+GelmtTTBe27/zo5bzkbqVUWhwDon8+
 by27jwdwueYycLurz76hFu/C9+7E/8ObEPg4rJB3JUbQuj4Rzknd1XHkFA/znatrlmww
 njVAIB52mBWcbzQn1l09EB6FWFWQ1VWmfm2tLXVs3G9oH1NjJU+cpMvDNynv48QEXGLu
 koOg==
X-Gm-Message-State: AOAM532QyEju2Jmuir6YigJXF0KVl/c9bvRGmnjgJ1n7C0CzvXk2I8tW
 CQDjFYFwdduqFTFdaSc2JJsUUOHaD8Ud0IIDNP3vfv4uu+Aft/aZZwHRjJum3p9sMruJ8gQVmLv
 sV40aB7bmOxphEhPKMXQGGZCuktQnmnw=
X-Received: by 2002:a92:c901:0:b0:2cd:8d18:9a80 with SMTP id
 t1-20020a92c901000000b002cd8d189a80mr2667038ilp.200.1652453829275; 
 Fri, 13 May 2022 07:57:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyS9Bk/kTQcGeSO+VDw9viO3nLtceVBw4AyFYSNv5podu+rfFwSYRdU3Byq6fkHs0DoNvJOZAeINn3yB8PZgzE=
X-Received: by 2002:a92:c901:0:b0:2cd:8d18:9a80 with SMTP id
 t1-20020a92c901000000b002cd8d189a80mr2667028ilp.200.1652453829122; Fri, 13
 May 2022 07:57:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220512233849.2219275-1-afaria@redhat.com>
 <20220512233849.2219275-4-afaria@redhat.com>
 <9541f3e7-fa0a-0f05-e5db-18be833f997a@redhat.com>
In-Reply-To: <9541f3e7-fa0a-0f05-e5db-18be833f997a@redhat.com>
From: Alberto Faria <afaria@redhat.com>
Date: Fri, 13 May 2022 15:56:33 +0100
Message-ID: <CAELaAXxjJVa0XLkEiiH1EnRKjzB+3+X5qtZXF8SYzBZ0BwGEhw@mail.gmail.com>
Subject: Re: [PATCH 3/7] block: Make bdrv_{pread, pwrite}() return 0 on success
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, 
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, May 13, 2022 at 9:22 AM Paolo Bonzini <pbonzini@redhat.com> wrote:
> The callers only check the return code of vhdx_log_peek_hdr,
> vhdx_log_read_sectors, vhdx_log_write_sectors with ret < 0.  But looking
> at the callers:
>
> - vhdx_log_read_desc propagates ret directly from a successful
> vhdx_log_read_sectors, but its callers don't care about which
> nonnegative result is returned
>
> - vhdx_validate_log_entry might occasionally return ret directly from a
> successful vhdx_log_read_desc or vhdx_log_read_sectors, but
> vhdx_log_search, the caller of vhdx_validate_log_entry, also doesn't
> care about which nonnegative result is returned
>
> - vhdx_log_flush only returns a successful return value from bdrv_flush
>
> - vhdx_log_write propagates ret directly from a successful
> vhdx_log_write_sectors, but vhdx_log_write_and_flush only returns a
> successful return value from vhdx_log_flush
>
> So (perhaps as a separate patch?) you can remove the three assignments
> of ret.

Thanks, I'll fix this. I think I'll just fold it in, but let me know
if it really should be split into a separate patch.

> As an aside, while reviewing I noticed this in qcow2_mark_dirty:
>
>      ret = bdrv_pwrite(bs->file, offsetof(QCowHeader,
> incompatible_features),
>                        &val, sizeof(val));
>      if (ret < 0) {
>          return ret;
>      }
>      ret = bdrv_flush(bs->file->bs);
>      if (ret < 0) {
>          return ret;
>      }
>
> I'm not sure if there are other occurrencies, perhaps you can try using
> Coccinelle to find them and change them to a bdrv_pwrite_sync.

Looks like this is the only occurrence. I'll add a patch to convert it
to bdrv_pwrite_sync().

Alberto


