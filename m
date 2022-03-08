Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B175D4D1526
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 11:51:27 +0100 (CET)
Received: from localhost ([::1]:38004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRXR8-0006NJ-Qi
	for lists+qemu-devel@lfdr.de; Tue, 08 Mar 2022 05:51:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRXOL-0002sJ-3n
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:48:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nRXOH-0006FC-0F
 for qemu-devel@nongnu.org; Tue, 08 Mar 2022 05:48:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646736508;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AnC9ehja7ZSJ6msiheS+nNacdW6wbFxQ3RGKfaD8O5k=;
 b=ShBnyN1D6VcelytBsW4rQgLwQSSyX0+4tfUfhBsZWbib8OnPzPbE7D27f1aM3RQJ0sVB32
 mSmWjOC8QFTAJwYu7+qdxgwr+EjD+qnVEftmBsONvM+NCsP5XAqz56NDWH0eDOi5XwswWV
 5AZg1ycsp0/CchzDsDEWgDwaVaNno44=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-qYDG_4DvPPunyQVPa-j3oA-1; Tue, 08 Mar 2022 05:48:26 -0500
X-MC-Unique: qYDG_4DvPPunyQVPa-j3oA-1
Received: by mail-ed1-f69.google.com with SMTP id
 e10-20020a056402190a00b00410f20467abso10349158edz.14
 for <qemu-devel@nongnu.org>; Tue, 08 Mar 2022 02:48:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AnC9ehja7ZSJ6msiheS+nNacdW6wbFxQ3RGKfaD8O5k=;
 b=ffka5JYaqqqPQ7kIsrbd8wgF0veXY98QL5OrTrmhuEWdcx3aGM3LzAZOSixLBmy5Yj
 pvgyV6DairrdgpegDKym8ORx2QT8ARmPtohexyFR8pA2De1Ojl95MRG0kAcrvrsNjEHW
 UnWzDyKYHYAAYjL5BO8cF9Z3g0AsyXlYLzZ6zmlxx1py0jN0ec7CmFyuHeayHcDXc5YZ
 Ho45erhBkmyvJt538+qS53W77kHxYqo92+WgpM1bm8o+Cu3WEFm8CGysx9EaPLBnM7+N
 j7deGA5WZyRBEi8Y+YoeFRyt5BVqXwWU5wBEdNQ6zTL++95rKabj4IiOns1a39dniDzA
 S4OA==
X-Gm-Message-State: AOAM530Z+ZOSpXRLYbxfGnNb2cnJzodZTG3I+wy6ahPZ3JU43Dk9E+Wj
 v72LODo7EgI1Wxxkvzhua0r5ltqP1iubsy33OfS7o6V4AviMaTY9ILR9vFWhbUuFSapQ/4coaz4
 eI9xcedl3e5u/+po=
X-Received: by 2002:a17:907:2ce3:b0:6da:b9f4:c100 with SMTP id
 hz3-20020a1709072ce300b006dab9f4c100mr12260257ejc.573.1646736505773; 
 Tue, 08 Mar 2022 02:48:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw73tUo/sc6bSY1rnt1E3h/MWEHU6Uwo/FK7zyJJjJIiZwAoLv6FB1YhFDm08NtbzewiVsZ2A==
X-Received: by 2002:a17:907:2ce3:b0:6da:b9f4:c100 with SMTP id
 hz3-20020a1709072ce300b006dab9f4c100mr12260238ejc.573.1646736505582; 
 Tue, 08 Mar 2022 02:48:25 -0800 (PST)
Received: from redhat.com ([2.55.138.228]) by smtp.gmail.com with ESMTPSA id
 r22-20020a17090638d600b006d584aaa9c9sm5700447ejd.133.2022.03.08.02.48.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 02:48:25 -0800 (PST)
Date: Tue, 8 Mar 2022 05:48:20 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH v5 00/15] vDPA shadow virtqueue
Message-ID: <20220308054623-mutt-send-email-mst@kernel.org>
References: <20220307153334.3854134-1-eperezma@redhat.com>
 <14d4fde4-6ea5-4805-b684-c33f6b448565@redhat.com>
 <20220308020348-mutt-send-email-mst@kernel.org>
 <CACGkMEvY-+XpPWbtiX9dy+fwDxPp7sHFhH_LY0PB2YuusEugyw@mail.gmail.com>
 <20220308022300-mutt-send-email-mst@kernel.org>
 <CACGkMEvuTPCRk7Ng7CbgpPSPgs_QYijzc5fU+cV3kW09W1R7Qg@mail.gmail.com>
 <20220308024724-mutt-send-email-mst@kernel.org>
 <CACGkMEsPBDM8ko1qgnCR1DcofPNJJo3S2j3pOJHk4xaSGQimcQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsPBDM8ko1qgnCR1DcofPNJJo3S2j3pOJHk4xaSGQimcQ@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 08, 2022 at 04:20:53PM +0800, Jason Wang wrote:
> > Not by itself but I'm not sure we can guarantee guest will not
> > attempt to use the IOVA addresses we are reserving down
> > the road.
> 
> The IOVA is allocated via the listeners and stored in the iova tree
> per GPA range as IOVA->(GPA)->HVA.Guests will only see GPA, Qemu
> virtio core see GPA to HVA mapping. And we do a reverse lookup to find
> the HVA->IOVA we allocated previously.  So we have double check here:
> 
> 1) Qemu memory core to make sure the GPA that guest uses is valid
> 2) the IOVA tree that guarantees there will be no HVA beyond what
> guest can see is used
> 
> So technically, there's no way for the guest to use the IOVA address
> allocated for the shadow virtqueue.
> 
> Thanks

I mean, IOVA is programmed in the host hardware to translate to HPA, right?

-- 
MST


