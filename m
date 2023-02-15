Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB25697769
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 08:34:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSCIB-00072k-R4; Wed, 15 Feb 2023 02:33:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSCI8-000729-K0
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 02:33:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pSCI7-00024A-0H
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 02:33:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676446401;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wv0Ku0w/R7h86dE8h0fFC/h1KSI3MSg0S6BdjoPQ1Oc=;
 b=iNNlLqQjg99TZRiFmPCmlfIs+9ITthjqwcTe7W6qhPlotJXkN+qzz/Yf+rnuu2eds5tZZt
 9LkKulseiddKNC8vpKLvBfAbViyGpCVi8mJPbLj54tGYjOiiMuPxxwa/yyE8GG3BXvRRQa
 pgd0MK6RDATxMHhnAsuF7zix00HcTSI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-556-xtI1y_bFMrCaCpNH5-8GLg-1; Wed, 15 Feb 2023 02:33:20 -0500
X-MC-Unique: xtI1y_bFMrCaCpNH5-8GLg-1
Received: by mail-wm1-f69.google.com with SMTP id
 o42-20020a05600c512a00b003dc5341afbaso688081wms.7
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 23:33:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wv0Ku0w/R7h86dE8h0fFC/h1KSI3MSg0S6BdjoPQ1Oc=;
 b=Qty1uZmkdev/1FYk6CGjJSRdSyBJIVaGoVxZvAI4jUQqqZbygGvlYqjGX2x6K3tVqI
 03cG0HiC/EPEukHeXv7bntAR2IIo+3PmigA8dX84EN78z0iYR7wmiifVTAIkN3NbzEk8
 GqaHX1bXlx1R/Q7PkXMUZ0ejFtRAA3R69QUQwITmJV2ytPp2sEsxPRHmvFL8ghQfL3bq
 777/3VWfHwUG2Wg0eX5I2DmCr8I26GlnElWrEbOT/c7jxmBKnwSXR/y1V2hvziDyQpN9
 xV6HqBDmoJ5ZbHdRCky9K9gNB5NQ4oMpogsaOJF1YBcc9wDHuFiWHf0HHcBp3kxn0NwE
 2jeA==
X-Gm-Message-State: AO0yUKV2m87ZM/Nz8H7DDVC+d4TVWYTpviTKSeZvKyQJQ6MqXAbCnklD
 RFwCJsOBLo48Wagdj9iMr40o/T4DDe27o2cw//Q/y4dzhG522qLeIKBNQrHmmd+o2xe+lZxmK3i
 SFStoi31V2sHFW1M=
X-Received: by 2002:adf:eec3:0:b0:2c5:54a7:3630 with SMTP id
 a3-20020adfeec3000000b002c554a73630mr734047wrp.46.1676446399437; 
 Tue, 14 Feb 2023 23:33:19 -0800 (PST)
X-Google-Smtp-Source: AK7set9YG7Dlnt4gQIy7RM1LsJrgeWbNBszmpB1KMzfYqdQOsBU+BrhVDj2wGpler/2698lhVM8zjQ==
X-Received: by 2002:adf:eec3:0:b0:2c5:54a7:3630 with SMTP id
 a3-20020adfeec3000000b002c554a73630mr734023wrp.46.1676446399183; 
 Tue, 14 Feb 2023 23:33:19 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 g4-20020a5d6984000000b002c552c6c8c2sm9338662wru.87.2023.02.14.23.33.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 23:33:18 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: Avihai Horon <avihaih@nvidia.com>
Cc: <qemu-devel@nongnu.org>,  Alex Williamson <alex.williamson@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Cornelia Huck <cohuck@redhat.com>,  Paolo Bonzini
 <pbonzini@redhat.com>,  Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>,  =?utf-8?Q?C=C3=A9dric?= Le Goater
 <clg@redhat.com>,  Yishai
 Hadas <yishaih@nvidia.com>,  Jason Gunthorpe <jgg@nvidia.com>,  Maor
 Gottlieb <maorg@nvidia.com>,  Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>,  Joao Martins
 <joao.m.martins@oracle.com>
Subject: Re: [PATCH v10 04/12] migration/qemu-file: Add qemu_file_get_to_fd()
In-Reply-To: <20230209192043.14885-5-avihaih@nvidia.com> (Avihai Horon's
 message of "Thu, 9 Feb 2023 21:20:35 +0200")
References: <20230209192043.14885-1-avihaih@nvidia.com>
 <20230209192043.14885-5-avihaih@nvidia.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Date: Wed, 15 Feb 2023 08:33:17 +0100
Message-ID: <874jrn5qo2.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Avihai Horon <avihaih@nvidia.com> wrote:
> Add new function qemu_file_get_to_fd() that allows reading data from
> QEMUFile and writing it straight into a given fd.
>
> This will be used later in VFIO migration code.
>
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


