Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C034939BD8C
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:46:46 +0200 (CEST)
Received: from localhost ([::1]:41820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpCy5-0001lY-R2
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:46:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lpCPP-0005yf-1i
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:10:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lpCPK-0002fT-KW
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:10:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622823048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZMAgaj/d/+9w0ORG2cfnOZE+OiWj+b2gVAcmINRQrUQ=;
 b=PMFSpCLQQPxKA7hhi4xR6CvjQfvrnHNrA60iPU6hxq6k4kPr52FOtj7sJx10Qw11rwCWlv
 bF61mIECL+CSsu3T6BIueeJWypsTM/27ms/24phfKC+fakBnYECUqbcIafVcLqUNKXffrW
 Fd8BBTza4qA7NtdxDDvZ6eyLoal9qFg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-OCpciW_AMOuimg0iz-vPuA-1; Fri, 04 Jun 2021 12:10:45 -0400
X-MC-Unique: OCpciW_AMOuimg0iz-vPuA-1
Received: by mail-ed1-f71.google.com with SMTP id
 j13-20020aa7de8d0000b029038fc8e57037so5239980edv.0
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 09:10:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=ZMAgaj/d/+9w0ORG2cfnOZE+OiWj+b2gVAcmINRQrUQ=;
 b=qYf5oIMlMuhHeTWZUux85SUVFrcy2iwagIc0gQrYVOG4e/M/+TS+d1TrpSpPiPBsDq
 6RaOV9HQtTauX1Lt7yTgxZAhT0Y+DgbK+fYsxFj/92AIYZFDttrQuCy4VmX32fuYEfEW
 xywAqYuWUGcCitEK+aiPVTHwKJu9d1iVOmogBO4nG/hr7edS1thjdnLSRUzTgu2Oq/kn
 2Dv3iJLQFlZb3EymP87iSIdgxVZOAl8F8XEimYVDndLhXSDbJRbviaQ/7jRMQXsgGr0r
 59rnaAtzA9ZVmqvkE9EOeivkwSp9PTnGoyjuEAqsMJjLTgZwa0lrdKXMBtq2DWp+V42F
 Gqaw==
X-Gm-Message-State: AOAM531ie+HwqfnbDOyBoL69KRlzUdgRdL/Nez15ixYGOhRUrUHgIT9Y
 wDsG1Bn9sdXiBgoxWaYHE5yAyDc1nGFEGbA05Dxuf0QU1yTwhUIY+yQDoubjSl6C37BnakUmb7V
 uNy7RNjuzxFroJUcfPkndnDVua6S4UD6k79pha3EB+77cIY4avsP77INddOSanTWc
X-Received: by 2002:a17:906:fcaa:: with SMTP id
 qw10mr4798242ejb.233.1622823044475; 
 Fri, 04 Jun 2021 09:10:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDU4Ycas61T31sHHJlaBBvsGqZaMEtDKYKjX8jiVPZhlmMieqH2acuYNTTTsoIz4Fclbcf+A==
X-Received: by 2002:a17:906:fcaa:: with SMTP id
 qw10mr4798211ejb.233.1622823044178; 
 Fri, 04 Jun 2021 09:10:44 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 l11sm2949481ejd.103.2021.06.04.09.10.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 09:10:43 -0700 (PDT)
Subject: Re: [PATCH] block/snapshot: Clarify goto fallback behavior
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210503095418.31521-1-mreitz@redhat.com>
 <CAFEAcA_33PcmTSTAGGM=KGdP8Qrh-xKBdEa1d97HUhkWChzVSw@mail.gmail.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <d2987f44-d1f6-88e2-123a-be9c6071b833@redhat.com>
Date: Fri, 4 Jun 2021 18:10:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_33PcmTSTAGGM=KGdP8Qrh-xKBdEa1d97HUhkWChzVSw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.59, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03.06.21 18:02, Peter Maydell wrote:
> On Mon, 3 May 2021 at 10:55, Max Reitz <mreitz@redhat.com> wrote:
>> In the bdrv_snapshot_goto() fallback code, we work with a pointer to
>> either bs->file or bs->backing.  We close that child, close the node
>> (with .bdrv_close()), apply the snapshot on the child node, and then
>> re-open the node (with .bdrv_open()).
>>
>> In order for .bdrv_open() to attach the same child node that we had
>> before, we pass "file={child-node}" or "backing={child-node}" to it.
>> Therefore, when .bdrv_open() has returned success, we can assume that
>> bs->file or bs->backing (respectively) points to our original child
>> again.  This is verified by an assertion.
>>
>> All of this is not immediately clear from a quick glance at the code,
>> so add a comment to the assertion what it is for, and why it is valid.
>> It certainly confused Coverity.
>>
>> Reported-by: Coverity (CID 1452774)
>> Signed-off-by: Max Reitz <mreitz@redhat.com>
> Did this patch get lost? I was just going through outstanding
> coverity issues and noticed it was posted a month ago and not
> in master...

Oh, right, sorry.  Thanks for the reminder.

Now applied to my block branch:

https://github.com/XanClic/qemu/commits/block


