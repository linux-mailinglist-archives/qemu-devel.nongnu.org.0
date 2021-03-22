Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C04343DA1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 11:18:38 +0100 (CET)
Received: from localhost ([::1]:46444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOHds-0008KX-TP
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 06:18:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lOHbF-0006dh-Qa
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:15:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33713)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lOHbD-0006zW-0M
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 06:15:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616408149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=COtNwWD6w3g9vENXmTpj1NF+FFcQRsu4MMR+jpek34s=;
 b=Iwk7lfR68vQZ+bAn8Gz2uu3ZGLHhQeBiEUBSdIdPOlGorZCIjPkP3Llr0Y/dK0L5ETmY1l
 1ytYIk34RZ1JRUn0ISGm68uLURiGWzVE049qUb+WBdIiCpKY/8IR4ZAGRUY+bnSbA7Kf8w
 Ih5ad6nrMOzHuSSnW7Fjg+0C/CrrB9g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-500-qXneBPkGOn6AT5EyK1Zqgg-1; Mon, 22 Mar 2021 06:15:47 -0400
X-MC-Unique: qXneBPkGOn6AT5EyK1Zqgg-1
Received: by mail-wm1-f71.google.com with SMTP id j8so4955090wmq.6
 for <qemu-devel@nongnu.org>; Mon, 22 Mar 2021 03:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=COtNwWD6w3g9vENXmTpj1NF+FFcQRsu4MMR+jpek34s=;
 b=noDkypTkwbaX75zfII7mBR+uXccqcne8u+BjDDI4Ux0lZB8KsXhu4HlMx32hg8oUsA
 KmUfJx1tzFNLTq1gf0j8dEpZmhsl9RrYreH4u4nhcid1nn3c9Aq+v5E1pyRn/T8RWA+W
 g+wnu7BAvnFkewuWtHZsKMrsyXXEkxuRp9HICKWino11AFo+EEFULYAREHpALFSV/Bco
 LBXEQu7GHfebsLaGvQCUpY8Sclbhtgmi2bhvDyKBHxqO3khl1Z44AQ2SFBL+NfWVUpez
 AD7weu+kTpKpcNBL66XkD8bW9OBiftU145VluMUsk/5vbHhKZm40uNakv8hsvNYVhkMe
 R+FQ==
X-Gm-Message-State: AOAM530MkPDCpofWSiFHavNGym//oY+znmgzZBzluwbhK1GGdGRef6o9
 s/NA3/XhEEYeCSKTnS//lhXkFgjR64o/TuVTPq/aXzdqm6jo9RdugwuVqDlpOwWwlRodGwV374J
 n5VBM8plFBTmvQC4=
X-Received: by 2002:a7b:c214:: with SMTP id x20mr15331690wmi.186.1616408145988; 
 Mon, 22 Mar 2021 03:15:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaWE7zrxtcGzGmXrUOwAGjBBrheibDlEgCpXSQ4PnN9jq7ThVDCaSc0p0yHfV4UaJRcG2pIw==
X-Received: by 2002:a7b:c214:: with SMTP id x20mr15331679wmi.186.1616408145831; 
 Mon, 22 Mar 2021 03:15:45 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v7sm16390768wme.47.2021.03.22.03.15.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Mar 2021 03:15:45 -0700 (PDT)
Subject: Re: spurious error in check-dco job?
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: "Daniel P . Berrange" <berrange@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <fe4d7204-610c-37f2-b928-6a833dcf1e5f@redhat.com>
Message-ID: <6c140a31-694f-e0f0-d526-f790ac5a1747@redhat.com>
Date: Mon, 22 Mar 2021 11:15:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <fe4d7204-610c-37f2-b928-6a833dcf1e5f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Wainer

On 3/19/21 11:44 AM, Philippe Mathieu-Daudé wrote:
> Hi Daniel,
> 
> I'm getting this error sometimes in the check-dco job:
> 
> Using docker image
> sha256:96fcfc3ceb2d65689c2918c1c501c45b2bd815d82e7fb3381048c9f252e7b046
> for registry.gitlab.com/philmd/qemu2/qemu/centos8:latest with digest
> registry.gitlab.com/philmd/qemu2/qemu/centos8@sha256:798eb3e5aa50eb04d60cdf1bfd08bcff5b443e933dcfd902ebda01927e2f6eb0
> ...
> $ .gitlab-ci.d/check-dco.py
> Traceback (most recent call last):
>   File ".gitlab-ci.d/check-dco.py", line 25, in <module>
>     stderr=subprocess.DEVNULL)
>   File "/usr/lib64/python3.6/subprocess.py", line 311, in check_call
>     raise CalledProcessError(retcode, cmd)
> subprocess.CalledProcessError: Command '['git', 'fetch', 'check-dco',
> 'master']' returned non-zero exit status 128.
> 
> https://gitlab.com/philmd/qemu2/-/jobs/1108482890

Can this be a runner capabilities problem? Sorry but
I'm lost here.


