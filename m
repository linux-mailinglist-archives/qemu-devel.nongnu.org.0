Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E56552018
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 17:14:16 +0200 (CEST)
Received: from localhost ([::1]:57358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3J6V-0006ne-9J
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 11:14:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3J4D-0004it-1z
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:11:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1o3J4B-0008UE-E3
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 11:11:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655737910;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mcXBz5bioKfjfAJ2OEv5wiJz+V+yIYBm1tozKa5+sx8=;
 b=E/VpJNL3v16vsn9bkILYeLdaufR5miMaAquKchGisL99StYpGZb6fJy3bLDu63QwVhB8PE
 qG5+hikkInva4TzLnpfXSW1vglyX4+5w8LWNKt1kS3pky62YlsWTqWAN2Ss6Vb8mqna+5A
 RFpm0lPpqMAOgmZrZ3msjzeXYd2cOSM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-BdhjIiIIPKOahiFxIfuyZw-1; Mon, 20 Jun 2022 11:11:49 -0400
X-MC-Unique: BdhjIiIIPKOahiFxIfuyZw-1
Received: by mail-wr1-f72.google.com with SMTP id
 u18-20020adfb212000000b0021855847651so2600703wra.6
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 08:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mcXBz5bioKfjfAJ2OEv5wiJz+V+yIYBm1tozKa5+sx8=;
 b=bdRl+dAs0T8ep1cIyYdZ5kEHcbJA4aE5CCytNXa5WYE9g6UyQToDtCveFx/XNhL7Wu
 MxqKPlDPCksi+joSHquf6K9nVr9fuk9F4dDmqNdGdmtIrUBdZ84HIf+6OzbZETYu/dXY
 qr0oLSiED9wo7HG0/6tmpQ+3GSLEDlyfV86rqeekN+XvxFrjdn25+PQvoLqT9kkXfYS9
 xqBOWmx3KTD5+lYB8O77Y7TgKNPAiJnKQiu4k6eRfvX9nxPPFrE4EyUGHGr5/pMNbuzp
 qVB2lHhuDf9HIrLCO5lmm+/182oz2Uthw8t1/XQeX7aw2mhzvXTrhAT0//nDOMABCWul
 /MQw==
X-Gm-Message-State: AJIora8BO/U+OuwFeYplDmfAFSBsp/d5ky71X8cJqROfT40kdWq+1fsa
 0/2gzXY63k/lqUuza0+j+x1Dk6jX3htIxfAzpwXl/kstgh2N/Rzl2IAb+IC77GdD/lpZDACyWJH
 DsedlvnDBXn8FO3U=
X-Received: by 2002:a5d:6f1c:0:b0:213:d715:d09f with SMTP id
 ay28-20020a5d6f1c000000b00213d715d09fmr23493229wrb.275.1655737908566; 
 Mon, 20 Jun 2022 08:11:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vITQesYItId73NjayWV65I+plv4o6VTTfcm/5L9LDUyqeA7AC4IvR8VkIFRdpPookLdqcVXw==
X-Received: by 2002:a5d:6f1c:0:b0:213:d715:d09f with SMTP id
 ay28-20020a5d6f1c000000b00213d715d09fmr23493212wrb.275.1655737908408; 
 Mon, 20 Jun 2022 08:11:48 -0700 (PDT)
Received: from localhost ([212.145.226.77]) by smtp.gmail.com with ESMTPSA id
 d3-20020adffbc3000000b0020e6ce4dabdsm13572359wrs.103.2022.06.20.08.11.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 08:11:48 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,  qemu-block@nongnu.org,  "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>,  Stefan Hajnoczi <stefanha@redhat.com>,  Hailiang
 Zhang <zhang.zhanghailiang@huawei.com>,  Fam Zheng <fam@euphon.net>,
 Hailiang Zhang <zhanghailiang@xfusion.com>
Subject: Re: [PATCH v2 04/21] migration: rename rate limiting fields in
 QEMUFile
In-Reply-To: <20220620110205.1357829-5-berrange@redhat.com> ("Daniel
 P. =?utf-8?Q?Berrang=C3=A9=22's?= message of "Mon, 20 Jun 2022 12:01:48
 +0100")
References: <20220620110205.1357829-1-berrange@redhat.com>
 <20220620110205.1357829-5-berrange@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Mon, 20 Jun 2022 17:11:47 +0200
Message-ID: <87y1xr2wuk.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> This renames the following QEMUFile fields
>
>  * bytes_xfer -> rate_limit_used
>  * xfer_limit -> rate_limit_max
>
> The intent is to make it clear that 'bytes_xfer' is specifically related
> to rate limiting of data and applies to data queued, which need not have
> been transferred on the wire yet if a flush hasn't taken place.
>
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>

Reviewed-by: Juan Quintela <quintela@redhat.com>


