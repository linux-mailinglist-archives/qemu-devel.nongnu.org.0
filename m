Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32F2346FF3B
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 11:58:21 +0100 (CET)
Received: from localhost ([::1]:38698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvdbX-0008G9-SX
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 05:58:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mvdaZ-0007WC-AZ
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 05:57:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mvdaW-0002PC-Nb
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 05:57:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639133835;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qOr+eyb+ika+oaVT7dUe9KzCHpLOPriK6towirskFDo=;
 b=U5MQIHxC9kOcOIHLYbSNfJj9xbOYmkPbh5FqoVfgDW0WSVVnF7PfY4TnVx88FW5B/ecpUT
 YjEjy7mRClCHoBFFbk/IzRlz5nqzQvA3LwrOT6gPUwWjbvnsnrtXf3AUd8476J5i1lQEOQ
 pVqvgGHkzeNWzoTeOKNTKMK+9uOuDEw=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-555-V29qe7ZHOyyjl-zrrMRgxA-1; Fri, 10 Dec 2021 05:57:14 -0500
X-MC-Unique: V29qe7ZHOyyjl-zrrMRgxA-1
Received: by mail-wr1-f71.google.com with SMTP id
 c4-20020adfed84000000b00185ca4eba36so2118919wro.21
 for <qemu-devel@nongnu.org>; Fri, 10 Dec 2021 02:57:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qOr+eyb+ika+oaVT7dUe9KzCHpLOPriK6towirskFDo=;
 b=V46HSzt6W/loTv6/mO1jvsbwpMw/As9MIkF+laBPFYJ8JlXzf6RXeNxT0xLIqR36bp
 I4pntmEa8HtxpiC/xqfErELOjT1FjUtwrVjPl9RM/CpGU5EWrWfTDV+yo7dTtiqXE5gS
 Z58NHtq5zBdjOYKRqLhWRrAtwZ/cMDrlLXClWIsErkjciMuZ3Qf/WxruyVFbpnNUA3zn
 36/fA9iFzFUcEF3n1ttF3hAZzlKCSZ5InEYpEtosTwMEWf78Ovw/yc4SlIntQX6x5nZm
 aL9Vx75qTMzudfanhb6PvrdoV8hrxnQvK7X25mrNY1bo73kJkV4CrrMRyKWvvNEqbiG6
 TeRg==
X-Gm-Message-State: AOAM532l18H27860TUvymDSa+RRygK+YgdlO83uBOyfd0V5i5vX8XmJa
 qvf56wb7kuj4HNFDPFWV/xT7AgmeYsxOxwdfx8UvSmCW9qoXFkLKBELoz24/T19yDoR/O+EJFLm
 xA7YHM2Fnij0NhDU=
X-Received: by 2002:a5d:4704:: with SMTP id y4mr12917381wrq.85.1639133833240; 
 Fri, 10 Dec 2021 02:57:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJymxEKc9Dei0dX/urqzenNpo2ikl+UtCqbdK+Qitp9LPoyuVZ3Y1t+0sRlMSDT9aSAQCQlTeQ==
X-Received: by 2002:a5d:4704:: with SMTP id y4mr12917364wrq.85.1639133833048; 
 Fri, 10 Dec 2021 02:57:13 -0800 (PST)
Received: from redhat.com ([2.55.18.120])
 by smtp.gmail.com with ESMTPSA id z5sm14467265wmp.26.2021.12.10.02.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Dec 2021 02:57:12 -0800 (PST)
Date: Fri, 10 Dec 2021 05:57:09 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Griffin <peter.griffin@linaro.org>
Subject: Re: [PATCH 5/8] standard-headers: Add virtio_video.h
Message-ID: <20211210055537-mutt-send-email-mst@kernel.org>
References: <20211209145601.331477-1-peter.griffin@linaro.org>
 <20211209145601.331477-6-peter.griffin@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20211209145601.331477-6-peter.griffin@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: marcandre.lureau@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 stratos-dev@op-lists.linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 09, 2021 at 02:55:58PM +0000, Peter Griffin wrote:
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
>  include/standard-headers/linux/virtio_video.h | 483 ++++++++++++++++++
>  1 file changed, 483 insertions(+)
>  create mode 100644 include/standard-headers/linux/virtio_video.h

We generally inherit these files from Linux.
Was the driver posted for inclusion in Linux?

-- 
MST


