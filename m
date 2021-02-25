Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE5D325A13
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Feb 2021 00:10:00 +0100 (CET)
Received: from localhost ([::1]:38518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFPlf-00038J-US
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 18:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFPjN-0002MJ-CT
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 18:07:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lFPjJ-0000Yt-4K
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 18:07:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614294452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r1psNVTcfauEDpFiI3f36FyOUt8703MWCNGItPkVb64=;
 b=CV/IoUPOR7ihsozOyS/Fzj7Tm13UYtEMuFOs+hIzcjb95e05k6OMwnt4A92XhQ0LWLVcA1
 jBOjUqsMEtqAP433dGJF1ebPhlWXu/UvTn9GSGnJtccTqzuND/z8BuUTMHo17uFNhm9E6G
 +MAVqdc8KiSAAPx9Vn+oSQEH77F+sdc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-427-33_sBKqRPGWhI7mNoq2aaA-1; Thu, 25 Feb 2021 18:07:29 -0500
X-MC-Unique: 33_sBKqRPGWhI7mNoq2aaA-1
Received: by mail-ed1-f72.google.com with SMTP id l6so3613038edn.22
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 15:07:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=r1psNVTcfauEDpFiI3f36FyOUt8703MWCNGItPkVb64=;
 b=Lv4k08J9LYQe+9qZWYYNHOSwxKI5orh0ZpanRIfGxFGvGi9/H80HgCpgCs+B4U6VVd
 lZK0TBH9hzqqRLQsVMbTiIadSQVR4AhRBOx4N6CXrHGa5oOvObqZP16pJdhlmPINj+dA
 feG4MH302Q+PYMpECEK1qCM9QDVoQHYmxFr0KH1qWQpd/xCpUdJKHByjTva6ApPJBCmk
 h40Lrj8WrBCpA0O5SvstcFktbMse/tc9L95FyzLjj73o9Yz11QYub4hxuJeEcw1l9mar
 zmYZzTDJd/9Qma2eaZbOU+Hek9kDPWfA7h/Hnfal0YfiCThHOhrweUSwVembJplrvtrB
 zPPQ==
X-Gm-Message-State: AOAM531vQJ0c1YYNLZ9z+UY6WhnIGXr85dJSD6XeRAip7oZYrRMUuU9l
 /TGIzEJCrkpbT4C67n8ra0g+hIox5hyK6gTr8qbafiu8605Uaevry3WZdjgvK85MSxoyyhtGi/D
 CP3btPuxBTBu8qJU=
X-Received: by 2002:a17:906:a099:: with SMTP id
 q25mr5051344ejy.549.1614294448684; 
 Thu, 25 Feb 2021 15:07:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQYtTsY43GMchA+hNoCnV45UL4/kGKMkof5f5J5eRYYWRZti2DH1fkU92sKO2BpWyzbUiqpg==
X-Received: by 2002:a17:906:a099:: with SMTP id
 q25mr5051326ejy.549.1614294448567; 
 Thu, 25 Feb 2021 15:07:28 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id ap14sm3856569ejc.13.2021.02.25.15.07.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Feb 2021 15:07:28 -0800 (PST)
Subject: Re: [PATCH v2 0/2] tests: Add functional test for out-of-process
 device emulation
To: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org
References: <20210225205907.223995-1-willianr@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5518f282-4fb4-57d4-37cf-c2cfda261e92@redhat.com>
Date: Fri, 26 Feb 2021 00:07:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210225205907.223995-1-willianr@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.435, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 9:59 PM, Willian Rampazzo wrote:
> This series is a respin to the "multi-process: Acceptance test for multiproce=
> ss
> QEMU" patch sent in December which, runs an Avocado functional test to check =
> if a
> remote lsi53c895a device gets identified by the guest:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg769188.html
> 
> First, we introduce the `exec_command` to the avocado_qemu package, which sen=
> ds a
> command to a console without the need to wait for a pattern as a result. This=
>  is
> useful when a test needs to execute a command that does not produce an output,
> like, for example, a `mount` command.
> 
> Then, the original test is refactored to simplify the code using the new
> `exec_command` function, remove the unnecessary change to the
> `wait_for_console_pattern` method and normalize the use of single quotes.
> 
> CI Pipeline: https://gitlab.com/willianrampazzo/qemu/-/pipelines/261946622
> 
> Supersedes: <785772783205140e219b8bfe7f793305ee768f03.1608705805.git.elena.uf=
> imtseva@oracle.com>
> 
> Jagannathan Raman (1):
>   tests: Add functional test for out-of-process device emulation
> 
> Willian Rampazzo (1):
>   avocado_qemu: add exec_command function
> 
>  tests/acceptance/avocado_qemu/__init__.py | 13 +++-
>  tests/acceptance/multiprocess.py          | 95 +++++++++++++++++++++++
>  2 files changed, 107 insertions(+), 1 deletion(-)
>  create mode 100644 tests/acceptance/multiprocess.py

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


