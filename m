Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 731CE60FCB5
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 18:12:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo5MS-0001sN-8d; Thu, 27 Oct 2022 12:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oo5M8-0001ao-V8
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 12:03:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oo5M7-0003xr-5C
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 12:03:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666886621;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NUP6v16X4npLEvNCf6p9sHF7ME9M41cCxRHKoDortJI=;
 b=WxN2le/l70Ubb/kx432XuYRLhRgZTXHb3Y5i69E0sc1QSydca9Smi0qjCjuwbFzdmVoga1
 bRr98Pv6QhSA01PMdufdp65NWlwe803jj2lrh4iHpcD2k7O+hVQOMPh7wGn2f+ncWDHLl6
 yU6hobSTLkb2/cFU0hj6BqtZOk7bT+I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-479-3RhyvJp8MuOkvorPzXJyQQ-1; Thu, 27 Oct 2022 12:03:40 -0400
X-MC-Unique: 3RhyvJp8MuOkvorPzXJyQQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 l1-20020a7bc341000000b003bfe1273d6cso716457wmj.4
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 09:03:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NUP6v16X4npLEvNCf6p9sHF7ME9M41cCxRHKoDortJI=;
 b=ld/NxICl4m4Bj3MQ/2alSA2sIIfezNOoZ+MBRXbutOKq06hrcPsW1Nfe/JVdhIU0c3
 bx4c60eKmKtr+qSs9b/i7r8FVh63U7ThYGqFrULtLAJAlVwVkYE70RCgkUhqfXGvfrgA
 r1OwnhHSzcSAvLX26ivQYkqxel4YcVJ6kgy+p3VLtK5Atz+AIfKRhxJnucYbGMR4xHLv
 bg0IFsmv51nBphK6BgHrI0U8W/XQZftPxW938aAWRDv9hxTVm9fc7xtDN92D6Y6y/mDt
 TnrCNsU6GRQkOKLRk7Y1wNjHKKBZLGfJ/csGe9knRSugoKr2oQyxPMasQI6wKq/47jKj
 z+HA==
X-Gm-Message-State: ACrzQf1xcQYe4iU7w2PsludU0FJAAEUWNTj+GTVHui5D6J5xfVidwbDn
 wMTeXDOf3GmfDOMdbXv+aXlXjf0dbmH8sqL1n1fHYoV5dxUFg+T9nvKD77e6F/n0YIXIzYcvvGU
 LzfuM9tZnjqoNgEs=
X-Received: by 2002:a05:6000:1845:b0:236:90d2:f239 with SMTP id
 c5-20020a056000184500b0023690d2f239mr4331150wri.711.1666886619354; 
 Thu, 27 Oct 2022 09:03:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4bbCKIrL0Pzsr/I6xwIShz2tuV+0OAXwVzrZezpZxmo8wdC18LB3HkbqEnbnR16POv+ha+MA==
X-Received: by 2002:a05:6000:1845:b0:236:90d2:f239 with SMTP id
 c5-20020a056000184500b0023690d2f239mr4331123wri.711.1666886619118; 
 Thu, 27 Oct 2022 09:03:39 -0700 (PDT)
Received: from [192.168.8.100] (tmo-066-116.customers.d1-online.com.
 [80.187.66.116]) by smtp.gmail.com with ESMTPSA id
 v18-20020a5d43d2000000b002366b241cf3sm1481564wrr.35.2022.10.27.09.03.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Oct 2022 09:03:38 -0700 (PDT)
Message-ID: <107c562f-6f8f-7534-7ee1-2147a5b140e4@redhat.com>
Date: Thu, 27 Oct 2022 18:03:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 19/26] tests/avocado: raspi2_initrd: Wait for guest
 shutdown message before stopping
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org,
 aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
 crosa@redhat.com, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221020115209.1761864-1-alex.bennee@linaro.org>
 <20221020115209.1761864-20-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221020115209.1761864-20-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/10/2022 13.52, Alex Bennée wrote:
> From: Peter Maydell <peter.maydell@linaro.org>
> 
> The avocado test
>   tests/avocado/boot_linux_console.py:BootLinuxConsole.test_arm_raspi2_initrd
> finishes wiith
> 
>      exec_command(self, 'halt')
>      # Wait for VM to shut down gracefully
>      self.vm.wait()
> 
> In theory this should be fine. In practice it runs into two bugs:
> 
>   * when the test calls self.vm.wait() Avocado closes the socket
>     connection to the guest serial console immediately, so the
>     avocado logs don't have the last part of the guest output:
>     https://gitlab.com/qemu-project/qemu/-/issues/1265
>   * when the socket is closed, a bug in the QEMU socket chardev
>     means that it loses any data that the guest UART has not
>     yet consumed. This means that the guest doesn't always read
>     the full 'halt' command string, so the test intermittently
>     fails with a timeout:
>     https://gitlab.com/qemu-project/qemu/-/issues/1264
> 
> Work around both of these by waiting for the guest to print the
> string that means it has completed the shutdown process.  This fixes
> a very long standing intermittent failure in this test.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/636
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20221020102012.3015662-1-peter.maydell@linaro.org>

Reviewed-by: Thomas Huth <thuth@redhat.com>


