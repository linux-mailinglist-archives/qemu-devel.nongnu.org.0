Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B581E9744
	for <lists+qemu-devel@lfdr.de>; Sun, 31 May 2020 13:27:10 +0200 (CEST)
Received: from localhost ([::1]:44056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jfM7R-0000JS-Fd
	for lists+qemu-devel@lfdr.de; Sun, 31 May 2020 07:27:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jfM5u-0008Em-Ij
 for qemu-devel@nongnu.org; Sun, 31 May 2020 07:25:34 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:44146
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jfM5s-0001Z0-Nj
 for qemu-devel@nongnu.org; Sun, 31 May 2020 07:25:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590924331;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=E7gb5BF9gmtl+bW+ok1h4ScDlaN3Ac+HP8rBtNhSC1A=;
 b=fvM7oomcPc+O47w9ZI8yvIEPgRlHXUSmRMZW120ZFahlIDL9EzAXDdfyOrKyz8T8uk6uiu
 jkJp8Y+h00apH7bpCLbiq9HyFhKbnBhXheRHFvT8V49jzV+6+6F4awy0tP+GCNyx1pCr8r
 YZ6T/Cbjwu1ErRUvewJ7bGxLW/atrSI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-MVh5W6UINYy3tu-CeADxgw-1; Sun, 31 May 2020 07:25:29 -0400
X-MC-Unique: MVh5W6UINYy3tu-CeADxgw-1
Received: by mail-wm1-f71.google.com with SMTP id u15so2095933wmm.5
 for <qemu-devel@nongnu.org>; Sun, 31 May 2020 04:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=E7gb5BF9gmtl+bW+ok1h4ScDlaN3Ac+HP8rBtNhSC1A=;
 b=NQuA/CPslkg03+4JeyzNJIgzKCgyKqggG1PEqt5QApOxDBHE9v5ZdUTj6pxIqmf22Z
 DlGpE9Rdx8GOT3PNPErWMomL68GCjaNEJMnKZHcmkYVri/SKg6xh8+1Nanb+y4JjRsOS
 sCh5A4cdKcHkYzV+u48NsZ6BiBFiXDZr9a5rhcPvi3jNm2O+b8u4Grrmsxc8/DNL5X/H
 LJfjYhUzmTVcqoBgGi4sKJW3fqpVYrTarw6PJB0tS3t9LZ6WNRiqEbL80PEVcuUbybMZ
 C46okIvb9rs3/iyuLH6kvdbNLEAKHdXqy9R6ufYNoHiCPnenXZN9P59arJJRJ9gcrXPF
 OvlA==
X-Gm-Message-State: AOAM531VrAxlYERWUsiDXSfz9ik1lPTvqJVRAxKydc/sk/QfF8tSCcgR
 yXhuYTg7ZsBqGL768CIzPWsExnBySaLSt3nTq51LTH4fCn7DM9FjCRh5uvIeFX7SrH9MINqIET5
 M5uVjvT21psGD+DM=
X-Received: by 2002:a1c:44c3:: with SMTP id r186mr16721510wma.67.1590924328625; 
 Sun, 31 May 2020 04:25:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKa3G8UVZV9rAOGezTmV8gyksfWU1YHPKiuTw5ZDvR39q5ogqlrxhHksgE/K8BiAsRRgbKKQ==
X-Received: by 2002:a1c:44c3:: with SMTP id r186mr16721499wma.67.1590924328424; 
 Sun, 31 May 2020 04:25:28 -0700 (PDT)
Received: from [192.168.1.34] (43.red-83-51-162.dynamicip.rima-tde.net.
 [83.51.162.43])
 by smtp.gmail.com with ESMTPSA id b18sm16421134wrn.88.2020.05.31.04.25.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 31 May 2020 04:25:27 -0700 (PDT)
Subject: Re: [PATCH v8 06/12] tests/vm: allow wait_ssh() to specify command
To: Robert Foley <robert.foley@linaro.org>, qemu-devel@nongnu.org
References: <20200529203458.1038-1-robert.foley@linaro.org>
 <20200529203458.1038-7-robert.foley@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <50496fcd-06a5-ade6-268e-d421a72d4b1e@redhat.com>
Date: Sun, 31 May 2020 13:25:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200529203458.1038-7-robert.foley@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/31 05:57:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Fam Zheng <fam@euphon.net>, peter.puhov@linaro.org, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/29/20 10:34 PM, Robert Foley wrote:
> This allows for waiting for completion of arbitrary commands.
> 
> Signed-off-by: Robert Foley <robert.foley@linaro.org>
> Reviewed-by: Peter Puhov <peter.puhov@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/vm/basevm.py | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/tests/vm/basevm.py b/tests/vm/basevm.py
> index 75a7ac2bd3..1aab9e3a24 100644
> --- a/tests/vm/basevm.py
> +++ b/tests/vm/basevm.py
> @@ -411,24 +411,24 @@ class BaseVM(object):
>      def print_step(self, text):
>          sys.stderr.write("### %s ...\n" % text)
>  
> -    def wait_ssh(self, wait_root=False, seconds=300):
> +    def wait_ssh(self, wait_root=False, seconds=300, cmd="exit 0"):
>          # Allow more time for VM to boot under TCG.
>          if not kvm_available(self.arch):
>              seconds *= self.tcg_ssh_timeout_multiplier
>          starttime = datetime.datetime.now()
>          endtime = starttime + datetime.timedelta(seconds=seconds)
> -        guest_up = False
> +        cmd_success = False
>          while datetime.datetime.now() < endtime:
> -            if wait_root and self.ssh_root("exit 0") == 0:
> -                guest_up = True
> +            if wait_root and self.ssh_root(cmd) == 0:
> +                cmd_success = True
>                  break
> -            elif self.ssh("exit 0") == 0:
> -                guest_up = True
> +            elif self.ssh(cmd) == 0:
> +                cmd_success = True
>                  break
>              seconds = (endtime - datetime.datetime.now()).total_seconds()
>              logging.debug("%ds before timeout", seconds)
>              time.sleep(1)
> -        if not guest_up:
> +        if not cmd_success:
>              raise Exception("Timeout while waiting for guest ssh")
>  
>      def shutdown(self):
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>


