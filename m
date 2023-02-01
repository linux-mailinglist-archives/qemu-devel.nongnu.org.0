Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC91C686E6D
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 19:55:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNIEp-00031z-7R; Wed, 01 Feb 2023 13:53:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNIEm-0002zz-M0
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 13:53:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pNIEj-0003FO-6Z
 for qemu-devel@nongnu.org; Wed, 01 Feb 2023 13:53:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675277616;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=muHBLhvvzscrM8oQZJdRzFUzHZKrk6d4eUCVdwl8E2g=;
 b=fQT7gUi5dsaMtu+HpvuursgscTSdB8WtPM4Ay79uqpgDzbJwIn1i4/HZYbzadvgzB2CjNq
 WbPVtjuxSsJpL+5FdARtdWc8A37rrMat9ePyou3TpLcxD+QcKxvyEKaCadGI6mD+m2ZNp/
 /SvQfiHs1+Ms2WOH76PI1hbl8s+R5Z0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-512-_vlJ6poyPv-qaj_A-zFGvA-1; Wed, 01 Feb 2023 13:53:30 -0500
X-MC-Unique: _vlJ6poyPv-qaj_A-zFGvA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n7-20020a05600c3b8700b003dc55dcb298so1415103wms.8
 for <qemu-devel@nongnu.org>; Wed, 01 Feb 2023 10:53:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:message-id:date:reply-to:user-agent:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=muHBLhvvzscrM8oQZJdRzFUzHZKrk6d4eUCVdwl8E2g=;
 b=qA8ru5COj1v5vac+Fw2VWfP0U+9szMVCvqzcRYuxUY6/JPOhkaaRDsjY/cxOT22OEq
 7xeOSl14DDmj+4oIdDF6GZEFEXqKoMaGGmx2idb65DJjPsvGLY7vMLwdwiVBUI04eMTA
 JG/yZt14ht0OFVxA5SzL8Q8f+VW6XYfbeOYJZogyMEbZ5UAWCtKNiCzNwFTKsTbzwLts
 0H96/uPN+V2KG4WoazJCQnoVGcXvcXMMTWYKgo2rXg2DxtSAAo6wFhjxO6PtN4QE935S
 uFhiVsMG/3LXyJLr3fZMl7kUSeDKkb4/2BzU6erI378o+6+2lrVPurpRYY//qfj5UTTP
 ZOQQ==
X-Gm-Message-State: AO0yUKVMAPXwIrPsPoKaVwPOKYKHpduImzmNo/eB/AQrGJn97WhbJodf
 8+WvCnRX0vwOTPdnPdv35CawULtiBjcY+WRkJP8eERiwugwYsvo4LjufivvDrDQ3mpTa9wQ+fzQ
 hQYI9zThyaDyLWsg=
X-Received: by 2002:a05:600c:540c:b0:3df:9858:c03d with SMTP id
 he12-20020a05600c540c00b003df9858c03dmr249623wmb.18.1675277609797; 
 Wed, 01 Feb 2023 10:53:29 -0800 (PST)
X-Google-Smtp-Source: AK7set+GlwWw1bOdEFF1G1rv47bN7jOjR2CtO1hzsK02rw3a0oXMD3dGR4e7MdUiielJFqBDsyObFA==
X-Received: by 2002:a05:600c:540c:b0:3df:9858:c03d with SMTP id
 he12-20020a05600c540c00b003df9858c03dmr249610wmb.18.1675277609553; 
 Wed, 01 Feb 2023 10:53:29 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 g24-20020a7bc4d8000000b003df30c94850sm1506792wmk.25.2023.02.01.10.53.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Feb 2023 10:53:28 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org,  Leonardo Bras Soares Passos
 <lsoaresp@redhat.com>,  James Houghton <jthoughton@google.com>,  "Dr .
 David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH RFC 14/21] migration: Map hugetlbfs ramblocks twice, and
 pre-allocate
In-Reply-To: <Y9hGJCkD6sYbFSgi@x1n> (Peter Xu's message of "Mon, 30 Jan 2023
 17:35:16 -0500")
References: <20230117220914.2062125-1-peterx@redhat.com>
 <20230117220914.2062125-15-peterx@redhat.com>
 <87edrciohn.fsf@secure.mitica> <Y9hGJCkD6sYbFSgi@x1n>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 01 Feb 2023 19:53:28 +0100
Message-ID: <874js5xlnb.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> On Mon, Jan 30, 2023 at 06:24:20AM +0100, Juan Quintela wrote:
>> I would consider here:
>> 
>>     uint8_t *host_doublemap;
>> 
>> as I have not a small name that means
>>     uint8_t *host_map_smaller_size_pages;
>> 
>> That explains why we need it.
>
> Sure, I can rename this one if it helps.
>
> One thing worth mention is that, it's not mapping things in small page size
> here with host_doublemap but in huge page size only.

Thanks.


> It's just that UFFDIO_CONTINUE needs another mapping to resolve the page
> faults. It'll be the guest hugetlb ramblocks that will be mapped in small
> pages during postcopy.

ok
>> Not initialized variables, remove the last two.
>
> I can do this.
>
>> 
>> > +    if (!migrate_hugetlb_doublemap()) {
>> > +        return 0;
>> > +    }
>> > +
>> 
>> I would move the declaration of the RAMBlock here.
>
> But isn't QEMU in most cases declaring variables at the start of any code
> block, rather than after or in the middle of any code segments?  IIRC some
> compiler should start to fail with it, even though not on the modern ones.

We can declare variables since c99.  Only 24 years have passed O:-)

Anyways:

Exhibit A: We already have that kind of code

static int nocomp_send_prepare(MultiFDSendParams *p, Error **errp)
{
    MultiFDPages_t *pages = p->pages;

    for (int i = 0; i < p->normal_num; i++) {
        p->iov[p->iovs_num].iov_base = pages->block->host + p->normal[i];
        p->iov[p->iovs_num].iov_len = p->page_size;
        p->iovs_num++;
    }

    p->next_packet_size = p->normal_num * p->page_size;
    p->flags |= MULTIFD_FLAG_NOCOMP;
    return nocomp;
}

Exhibit B:

from configure:

#if defined(__clang_major__) && defined(__clang_minor__)
# ifdef __apple_build_version__
#  if __clang_major__ < 10 || (__clang_major__ == 10 && __clang_minor__ < 0)
#   error You need at least XCode Clang v10.0 to compile QEMU
#  endif
# else
#  if __clang_major__ < 6 || (__clang_major__ == 6 && __clang_minor__ < 0)
#   error You need at least Clang v6.0 to compile QEMU
#  endif
# endif
#elif defined(__GNUC__) && defined(__GNUC_MINOR__)
# if __GNUC__ < 7 || (__GNUC__ == 7 && __GNUC_MINOR__ < 4)
#  error You need at least GCC v7.4.0 to compile QEMU
# endif
#else
# error You either need GCC or Clang to compiler QEMU
#endif
int main (void) { return 0; }
EOF

gcc-7.4.0: supports C11, so we are good here
https://gcc.gnu.org/onlinedocs/gcc-7.4.0/gcc/Standards.html#C-Language

clang 6.0: supports c11 and c17 standard
https://releases.llvm.org/6.0.0/tools/clang/docs/ReleaseNotes.html


So as far as I can see, we are good here.

Later, Juan.


