Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8816742D6
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 20:30:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIabK-0000Qt-Ow; Thu, 19 Jan 2023 14:29:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIabJ-0000QZ-Ny
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:29:29 -0500
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pIabI-0001WX-56
 for qemu-devel@nongnu.org; Thu, 19 Jan 2023 14:29:29 -0500
Received: by mail-pg1-x52b.google.com with SMTP id 78so2359801pgb.8
 for <qemu-devel@nongnu.org>; Thu, 19 Jan 2023 11:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=I84PT35YjStUx9GRy2bcqU53mL6oujapa2fqSWQO3sk=;
 b=MRyD2I3nqtigNPazUswVOJtuf29VJDWEZ1PPkbWC1bs6tw1EBB/L1xBms/Kep6XBTv
 MyOjFUt0+WPanlkMVSYIbQwsNj28cbWeO+wyf4uiJ7jVSFWb0ggeg3OowvgKlnGFHGly
 TxEMCPzcoO0jYQJHLxZxjV5A57c1cRVAZQkI0JlVbmzpysSGl+Rs6aUczyCphL7QxnXi
 gJ+GLXGi0FX1tLVEIj/x44vdWtZHsnOQZG96AZ0zqIgPHMtnPZ+ZgoYaWXyHqiji0OEH
 11t8Pb0x8WuFPQmAoOHfzQyX//OFRuVysilLdAfdbw2S6A8HmQiPdCotN8zp5nNdcWk1
 uh1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I84PT35YjStUx9GRy2bcqU53mL6oujapa2fqSWQO3sk=;
 b=OrXH/jryxQmCAaBRaX1QPCihNDi27FvU6cuQmyJtXwJFPD8LShcqYb3PCBIKJTF/hV
 lSy8ORUoCR0tyrGij/2zuXTKzb7+y4PpR49V5/V3QBpF7eHUcg96v68YOb7nKJaWBCR5
 lPOmWJgrM0i9m3b6ZJ7YDejf6T88JsUurJd0GAEYXHMH13odbbFPtkZdxtAV+m85yTXT
 SMdtP6oOnmML2InjQjbzTJmvCLYBlm6Y83okaM3uYz5u02HL4YsXwE+oVLrUjQKXn9Ep
 Noy5gaWRZdQSGzhLYz0HxGAGSSDQaGWqhSglLjp8oY7giAydBsLJfTqa+puyGEtYlOy1
 cP7Q==
X-Gm-Message-State: AFqh2kodOPxZQTcU2kQXypvRJP2H5EBCCPPYYaVnM34WIZGXMj+LC4It
 JOpGNi6q/Nxd2s2XM64+95ZLQA==
X-Google-Smtp-Source: AMrXdXsQM5MpTwKzpjo3z765B/b6o85XkswKyFqJdvGQYS8A1l+8nzv7SmKX10Hn9tHwSXXSctie6g==
X-Received: by 2002:a05:6a00:1887:b0:589:d831:ad2a with SMTP id
 x7-20020a056a00188700b00589d831ad2amr17937325pfh.6.1674156566257; 
 Thu, 19 Jan 2023 11:29:26 -0800 (PST)
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 z5-20020aa79485000000b0058d9710cb18sm8964535pfk.2.2023.01.19.11.29.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Jan 2023 11:29:25 -0800 (PST)
Message-ID: <f676bd5c-6c64-133d-0b1e-f0273c62e5b3@linaro.org>
Date: Thu, 19 Jan 2023 09:29:21 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v4 13/15] target/avocado: Pass parameters to migration
 test on aarch64
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20230119135424.5417-1-farosas@suse.de>
 <20230119135424.5417-14-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230119135424.5417-14-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 1/19/23 03:54, Fabiano Rosas wrote:
> The migration tests are currently broken for an aarch64 host because
> the tests pass no 'machine' and 'cpu' options on the QEMU command
> line. Most other architectures define a default value in QEMU for
> these options, but arm does not.
> 
> Add these options to the test class in case the test is being executed
> in an aarch64 host.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
> Don't we want to run migration tests for all the built targets? A
> cleaner approach would be to just subclass Migration for each
> archictecture like in boot_linux.py.
> ---
>   tests/avocado/migration.py | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -62,7 +72,6 @@ def _get_free_port(self):
>               self.cancel('Failed to find a free port')
>           return port
>   
> -
>       def test_migration_with_tcp_localhost(self):
>           dest_uri = 'tcp:localhost:%u' % self._get_free_port()
>           self.do_migrate(dest_uri)

Unrelated change.  Also, I think there's some python style guide that suggests 2 lines 
between functions and classes.


r~

