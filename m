Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D9E4D2A87
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 09:19:57 +0100 (CET)
Received: from localhost ([::1]:45072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRrY4-0002ES-It
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 03:19:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nRrU0-0000bq-FC
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:15:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nRrTw-0002yK-DI
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 03:15:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646813738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IQGsDgfSF8Kw9vxZ+gu1l0IplnaO0hq0RNvBXA+sM54=;
 b=TCjQ/KokoodHMfZVowO+9ue4rhGY8AJKdQnrS10bInMkcO/zxckl3659ZdtRSjENHD9DGI
 +wRa7HPxD5qQlsuRsKOvCL9Ba9k2wb/nuyy6CNKNTBjvHC2WQOh1weIzIpp0XaH3GVEcrF
 xmWYkMB3hlnuLbcK2/6P+cn6cgL049U=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-212-jyiaqRQlMCCCaPBO00WdfA-1; Wed, 09 Mar 2022 03:15:37 -0500
X-MC-Unique: jyiaqRQlMCCCaPBO00WdfA-1
Received: by mail-pl1-f197.google.com with SMTP id
 y3-20020a1709029b8300b0014c8bcb70a1so799628plp.3
 for <qemu-devel@nongnu.org>; Wed, 09 Mar 2022 00:15:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IQGsDgfSF8Kw9vxZ+gu1l0IplnaO0hq0RNvBXA+sM54=;
 b=5ryc3d22UNST3MoNElMz4OCX7OMLQn1KtmPafoCudZ1nZX/9Mu8pF1Yl3MplksJga1
 h3U7lreFa6KLY16Lj2i0p574VZXXz2w28fPf7VHk2XaQVfV+tyyYC6ZAtLfFeDqsL9Ee
 3zF5WniDgJU1lirKbk6QjHf77squ25VIEv1mWEKi0pOxFwajOQj4U9gvAuKYC2287wNN
 RzrY8LT50sXTyNooogcz58wmQ3JjEWBwvLrt4THFBLVC0QAjPJOckX+QJlo6XWT2cyR9
 OtPxBQhvPj3o581DKmdUarm4bUC/NWsMF0NfyIYeLKSqHAKof+ySpKSshBqBHRr6bDGu
 /gtw==
X-Gm-Message-State: AOAM530o2DgehU311LZGbNfrGRwNWb0XhEA/s7T5avnwaY9/PTGkM3vk
 9x9Mgdrdqrwu2AjW7QBfYeZU69O1f2K4R+gelc/A7Er8Q9g2sh30lMcndnkIpgmhEIIhi1+BAGr
 oxWGzhP9JJOSqAKc=
X-Received: by 2002:a05:6a00:84b:b0:4f7:439b:64e6 with SMTP id
 q11-20020a056a00084b00b004f7439b64e6mr4208201pfk.51.1646813736306; 
 Wed, 09 Mar 2022 00:15:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjt7wYmUS6huK2BOrY+8jGjuBaXK2e76PQHDJmizQXhGrpH7EOG83FDPQiglJ8wFF696nACA==
X-Received: by 2002:a05:6a00:84b:b0:4f7:439b:64e6 with SMTP id
 q11-20020a056a00084b00b004f7439b64e6mr4208159pfk.51.1646813735990; 
 Wed, 09 Mar 2022 00:15:35 -0800 (PST)
Received: from xz-m1.local ([94.177.118.47]) by smtp.gmail.com with ESMTPSA id
 l13-20020a056a00140d00b004e13da93eaasm1750449pfu.62.2022.03.09.00.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Mar 2022 00:15:35 -0800 (PST)
Date: Wed, 9 Mar 2022 16:15:24 +0800
From: Peter Xu <peterx@redhat.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Subject: Re: [PATCH v7 00/46] CXl 2.0 emulation Support
Message-ID: <YihiHNxVjDFI0Z8r@xz-m1.local>
References: <20220306174137.5707-1-Jonathan.Cameron@huawei.com>
 <20220306163119-mutt-send-email-mst@kernel.org>
 <20220307093918.00002f20@Huawei.com>
MIME-Version: 1.0
In-Reply-To: <20220307093918.00002f20@Huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ben Widawsky <ben.widawsky@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Samarth Saxena <samarths@cadence.com>,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org,
 linux-cxl@vger.kernel.org, linuxarm@huawei.com,
 Shreyas Shah <shreyas.shah@elastics.cloud>, Saransh Gupta1 <saransh@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 David Hildenbrand <david@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 07, 2022 at 09:39:18AM +0000, Jonathan Cameron via wrote:
> If any of the memory maintainers can take a look at patch 34 that would
> be great as to my mind that and the related interleave decoding in general is
> the big unknown in this set. I just realized I haven't cc'd everyone
> I should have for that - added them here and I'll make sure to CC them
> all on V8.

https://lore.kernel.org/qemu-devel/20220306174137.5707-35-Jonathan.Cameron@huawei.com/

Having mr->ops set but with memory_access_is_direct() returning true sounds
weird to me.

Sorry to have no understanding of the whole picture, but.. could you share
more on what's the interleaving requirement on the proxying, and why it
can't be done with adding some IO memory regions as sub-regions upon the
file one?

Thanks,

-- 
Peter Xu


