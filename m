Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 550FC3E7DD3
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 18:54:15 +0200 (CEST)
Received: from localhost ([::1]:38202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDV14-0004vM-D1
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 12:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mDV08-0004Cr-LG
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 12:53:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28338)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1mDV06-0004Sa-85
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 12:53:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628614392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udbZ9rTNQ+MOWLCTIrYp3C6ux230y11X+pCxFyq0ChI=;
 b=Ij+5o2tsvEM/NDSHuQhRuKwNqFP16/3KRKHMnRFvFn7eu61oCDoyfakzmsTlOAV/qPN8+G
 Pb4aX3KUS91hFec8FIfRPGp18kIhdGqXWuQtRxVhivO1wrOBE6gcCYRNV2SCrSdVuPvnHW
 5+Ch1LMj4H+TSTLp37Rryd9Wr7F1SNE=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-DJzjaS_uN3modXD4QdRlvw-1; Tue, 10 Aug 2021 12:53:11 -0400
X-MC-Unique: DJzjaS_uN3modXD4QdRlvw-1
Received: by mail-ot1-f71.google.com with SMTP id
 k12-20020a056830150cb02904ce6f14d298so7729068otp.20
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 09:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=udbZ9rTNQ+MOWLCTIrYp3C6ux230y11X+pCxFyq0ChI=;
 b=V0evnd5YlyFB7cocaD7emZDVEdX6KTgAmr8J0q270xGjkc+AI4crbC2wiB32BPVBq6
 FrEHGyjLyBQpIUFfshTJa6eTaR/M6wTO1yozAqdisu5WK2d54pyRqYIq0fv8ezKVIbZk
 xlf4NNqTbkKQhphcbrJIZx5yypo+a1muBw0slXQgl4/5pmFaiT1W9OvrhnEflgHy+98N
 kdGnoi4jNj/HfyxRqynU7bWYmUXBxJvYaSdWF6c+gy/ZG8kP6PIgt0XfSQLTdFjKF1ko
 NSoehmOItTrbbigbYOBT2PRGqmzaaailZNKdpl3lhrnIiFSQaZNvCubDij23lhh+8piB
 k2Eg==
X-Gm-Message-State: AOAM5300EbsjAs+X3VJvwHnGRL+nmbMA1Ahao18pNX2okCurcsyiaCNi
 oW2SrgGUtUpxRamZ/dRPCd4ozxNVeAaqRWF6Df2LPSFIkEvpTNZNx2exQVBVyov3qlD7vTnY/61
 2Yxe1XfshIDzCcqg=
X-Received: by 2002:a9d:eed:: with SMTP id 100mr21893717otj.50.1628614390330; 
 Tue, 10 Aug 2021 09:53:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqehjOMNJ5lURYc2DK0vl4BQW3fZAu+zWARIrmSscdQSq5svuzjB+Nbvj5JZLBLxPW+OjMZA==
X-Received: by 2002:a9d:eed:: with SMTP id 100mr21893675otj.50.1628614390081; 
 Tue, 10 Aug 2021 09:53:10 -0700 (PDT)
Received: from redhat.com ([198.99.80.109])
 by smtp.gmail.com with ESMTPSA id f3sm4153809otc.49.2021.08.10.09.53.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 09:53:09 -0700 (PDT)
Date: Tue, 10 Aug 2021 10:53:08 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Steve Sistare <steven.sistare@oracle.com>
Subject: Re: [PATCH V6 18/27] vfio-pci: refactor for cpr
Message-ID: <20210810105308.48315c37.alex.williamson@redhat.com>
In-Reply-To: <1628286241-217457-19-git-send-email-steven.sistare@oracle.com>
References: <1628286241-217457-1-git-send-email-steven.sistare@oracle.com>
 <1628286241-217457-19-git-send-email-steven.sistare@oracle.com>
Organization: Red Hat
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.704,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Zheng Chuan <zhengchuan@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri,  6 Aug 2021 14:43:52 -0700
Steve Sistare <steven.sistare@oracle.com> wrote:

> Export vfio_address_spaces and vfio_listener_skipped_section.
> Add optional name arg to vfio_add_kvm_msi_virq.
> Refactor vector use into a helper vfio_vector_init.
> All for use by cpr in a subsequent patch.  No functional change.

Why is the name arg optional?  It seems really inconsistent to me that
everything other than MSI/X uses this with a name, but MSI/X use NULL
and in an entirely separate pre-save step we then iterate through all
the {event,irq}fds to save them.  If we asked for a named notifier,
shouldn't we go ahead and save it under that name at that time?  ie.

static int vfio_named_notifier_init(VFIOPCIDevice *vdev, EventNotifier *e,
                                    const char *name, int nr)
{
    int ret, fd = load_event_fd(vdev, name, nr);

    if (fd >= 0) {
        event_notifier_init_fd(e, fd);
    } else {
        ret = event_notifier_init(e, 0);
        if (ret) {
            return ret;
        }
        save_event_fd(vdev, name, nr, e);
    }
    return 0;
}

Are we not doing this to avoid runtime overhead?

In the process, maybe we can use more descriptive names than
"interrupt", ex. "msi" or "msix".

It also feels a bit forced to me that the entire fd saving uses {name,
id} but vfio is the only caller that makes use of a non-zero id.
Should we instead just wrap all the calls from vfio to append the id to
the name so the common code can just use strcmp()?  Thanks,

Alex


