Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE415AC81E
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 01:34:48 +0200 (CEST)
Received: from localhost ([::1]:44160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUz8U-0006Xj-4N
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 19:34:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oUz7F-0005Af-B2
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 19:33:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1oUz7B-0004Wb-3t
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 19:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662334399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bTlHDcUvDaDSfWpK9BrCKbKG0kBvm3/P43YaSw3c1kY=;
 b=AREbl6hEP0YDRAKf/8MPPEK3Aqvq9U7DJEo+DlknbG1+EsdYlotgV0IBn0Mref3N9xN9u7
 8lkwLnczWXUxj/wQ32kZeUYwfT1rD6+xdez1NBbQhXPBxXpFNHuV4MzoGUnFQdNARPhmJo
 TjKoCMNGgkK6ckARRh8E9MErStyLWkc=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-496-QzDaaUW-O-ucYY3rE3yo_A-1; Sun, 04 Sep 2022 19:33:17 -0400
X-MC-Unique: QzDaaUW-O-ucYY3rE3yo_A-1
Received: by mail-il1-f199.google.com with SMTP id
 j11-20020a056e02218b00b002f17a1f9637so766107ila.3
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 16:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=bTlHDcUvDaDSfWpK9BrCKbKG0kBvm3/P43YaSw3c1kY=;
 b=KFH6MctBiB0iZi5pN08nvK494nzij5BmnHHlpQnwblfnCEhs+Tr68f1VGYbIsPJKCW
 M7I7XZvNgPjrzi6Yh5KeVHQaPg96vGTDy+MGZObFi15acXCtqNxLAIMMOIVCVGOBYiS2
 IFHpG4KUwjbBiVBb5Zi/lDNB3/78wqAMf0EG8vok4itl7gul0DWd4pBD63FW8gK/UM20
 OncMuuoy1d4GXsHfn0Y6gUvHwULr2+jTMU8Vi26wrx7b2ju6x7Oza7WgsoL+fzL9la30
 F2LEFqbHZDiVP7yiJcZ+PxXrodicYoXT3wFZ4IIvsqybRV8JbLNGNwfpT5M7I8xNCGvQ
 dzZg==
X-Gm-Message-State: ACgBeo0mhleV+rKtz0XzFoDl5enHFW1orFkxkxYDnKotmVw7tEO61CJo
 XInzLNJEYrMxrIE3YRhnZ0RNyZDrXBiB+qQX1qtmN6jTGqXg/e3j14d+2iKh485Z6AkuqiioCBN
 uT/zg2ZtKp3MXRwePDUhf0c/sm3bpFpg=
X-Received: by 2002:a05:6638:d45:b0:343:2ae6:e39a with SMTP id
 d5-20020a0566380d4500b003432ae6e39amr25053060jak.139.1662334396624; 
 Sun, 04 Sep 2022 16:33:16 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5WHWrauGWdUUwfycZFH1jtdQuoICfeTtlz3VYA6Ne+465YGLNlTMJvnNRdtw7nyFSnPX53u8r+THLue0Gi+co=
X-Received: by 2002:a05:6638:d45:b0:343:2ae6:e39a with SMTP id
 d5-20020a0566380d4500b003432ae6e39amr25053039jak.139.1662334396000; Sun, 04
 Sep 2022 16:33:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220826160927.322797-1-afaria@redhat.com>
 <YwppmYUOLTqQ7K25@xz-m1.local>
In-Reply-To: <YwppmYUOLTqQ7K25@xz-m1.local>
From: Alberto Campinho Faria <afaria@redhat.com>
Date: Mon, 5 Sep 2022 00:32:40 +0100
Message-ID: <CAELaAXyRSpqVj+KmvfG6ghCwf6WfxE+ym7F7O-rKZpsVKyQbUA@mail.gmail.com>
Subject: Re: [PATCH] softmmu/physmem: Fix address of FlatView access in
 address_space_(read|write)_cached_slow()
To: Peter Xu <peterx@redhat.com>
Cc: qemu-devel@nongnu.org, David Hildenbrand <david@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi Peter,

On Sat, Aug 27, 2022 at 7:59 PM Peter Xu <peterx@redhat.com> wrote:
> Any bug encountered?  It'll be great to add more information into the
> commit message if there is.  We could also mention the issue was observed
> by code review or so.

I came across this when performing unaligned 8-byte writes on
x86_64-softmmu. The write was aligned to 4 bytes but not 8, so the
first 4 bytes were written just fine by
address_space_translate_cached(), but flatview_write_continue() failed
to write the following 4 bytes as it was translating the wrong
address. I'll mention this in the commit description.

Thanks,
Alberto


