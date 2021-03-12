Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 137EF339135
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 16:26:02 +0100 (CET)
Received: from localhost ([::1]:50370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKjft-0002Oh-3y
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 10:26:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lKjUK-0007bg-Ha
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:14:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57594)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lKjUG-0000Wl-91
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 10:14:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615562039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2nyKhZMudE7Z57k68eOSiNI8/IUcsvZU9+nJj0cOZ5o=;
 b=dg+xm7Jb4wS61V+c5xj/s9JK3jL7ozMFE4pp4RWr7U5386b9FGmwLvfIOX5TI2kbI0znw3
 mFGYh6MneYS5AwCTMwSnnQiS9Q0ZCMSPMYI4ihO8jkQlyfXPtqaOtsrIgExII7Wuc7JrAW
 YgODBJjVSitxRhUu/DTXL7FapZen7xk=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-117-0-UAE_usMPmVbNPRKXPyDg-1; Fri, 12 Mar 2021 10:13:57 -0500
X-MC-Unique: 0-UAE_usMPmVbNPRKXPyDg-1
Received: by mail-ot1-f70.google.com with SMTP id a20so14841180otd.21
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 07:13:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2nyKhZMudE7Z57k68eOSiNI8/IUcsvZU9+nJj0cOZ5o=;
 b=VcP53zukizYsI3NvBAzD0YrHdCm7I26fmJ/weUuDu87hPbsyjPS4bwN8hLKUJSpPCU
 tbyhWX8KgIAsXRuyR2IDNTOaOL2LGQESCMVd/JUN6SvFtoFTh0VWD/42FCXjygWKj+cU
 4oG2ED5ywU28pCZ4h13I49TqiapUrPxG857Icuh2p/YXDQel4fRW+MNZeIJ6D+gU7qYV
 XkADBu3wGAXOK209cPrhsFfLvCI7DYGyCJHrdfE6Co0b8HGt/wZi4s9EDflX6yYAiRqV
 tTWjQK+4tretsLbfkld1pX0qfMF6oFSqERkwjFmuIZs6J7r3T0/ggII2qyLEtwlh7S2i
 Yo9Q==
X-Gm-Message-State: AOAM530WTCJZq6/+CVwF0wKHw9DWiMoxbmmD36qQH06DS5huUo0hWSAL
 XLYsJoO3qieeif0VWZpjhq5P454a3x4XklC2ijkyPVpe1zHBYEkOhv3UT/7Vbr+sJ6/Tk6FqkvK
 KXda0MEGyJYtoI1w=
X-Received: by 2002:a9d:74cc:: with SMTP id a12mr3683493otl.135.1615562035889; 
 Fri, 12 Mar 2021 07:13:55 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQVlPPZTWzAWwBeqRfPOzbTPAzalry8sOHl+lcZEWs5wOw+mImP+mOEB9GbrvYTLkTWko8RQ==
X-Received: by 2002:a9d:74cc:: with SMTP id a12mr3683483otl.135.1615562035717; 
 Fri, 12 Mar 2021 07:13:55 -0800 (PST)
Received: from [192.168.0.173] (ip68-103-222-6.ks.ok.cox.net. [68.103.222.6])
 by smtp.gmail.com with ESMTPSA id
 f44sm1433619otf.7.2021.03.12.07.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Mar 2021 07:13:55 -0800 (PST)
Subject: Re: [Virtio-fs] [PATCH 3/3] virtiofsd: Don't allow empty filenames
To: Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
References: <20210312141003.819108-1-groug@kaod.org>
 <20210312141003.819108-4-groug@kaod.org>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <c56bcaab-4a2d-219b-5d83-49dfd6fa1483@redhat.com>
Date: Fri, 12 Mar 2021 09:13:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312141003.819108-4-groug@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: virtio-fs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 8:10 AM, Greg Kurz wrote:
> POSIX.1-2017 clearly stipulates that empty filenames aren't
> allowed ([1] and [2]). Since virtiofsd is supposed to mirror
> the host file system hierarchy and the host can be assumed to
> be linux, we don't really expect clients to pass requests with
> an empty path in it. If they do so anyway, this would eventually
> cause an error when trying to create/lookup the actual inode
> on the underlying POSIX filesystem. But this could still confuse
> some code that wouldn't be ready to cope with this.
> 
> Filter out empty names coming from the client at the top level,
> so that the rest doesn't have to care about it. This is done
> everywhere we already call is_safe_path_component(), but
> in a separate helper since the usual error for empty path
> names is ENOENT instead of EINVAL.
> 
> [1] https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap03.html#tag_03_170
> [2] https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap04.html#tag_04_13
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>

Reviewed-by: Connor Kuehl <ckuehl@redhat.com>


