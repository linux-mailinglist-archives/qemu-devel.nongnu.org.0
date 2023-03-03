Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 461CE6A928D
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 09:34:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY0r7-0002JZ-Ij; Fri, 03 Mar 2023 03:33:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pY0r5-0002ID-Bs
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:33:31 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pY0r2-0005Gh-Pj
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 03:33:31 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1755e639b65so2214553fac.3
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 00:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1677832406;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5poiB9hHsOof3PcUw2itX1s4KSe9/ZAMgLRbkPBocmw=;
 b=mvLJzqqrxGqEpKJCzcXkHWsJzXDYvRUI9/8WhnoC5jMAhS6hFECIIKjvv4Nrlq5IpW
 alTyfan2iEPDzvYmdPuUvo68Ua5Wm+rDd6wiNsv3p0+NbJbTbdlrcoHCmhV1cPQgy7m4
 jtrgBiDJ2zghT2DogXC5TH/SMvjgYjOM0djawrNcYInkooTnRHug2L4Jocv0xTs7em7a
 uLJqKINe1IblAICeofJCsX8DL2nVp7wM7m03DrLUw3qHiXYtfAvQpXYLNhflvaMmofWe
 P5imBCzrGFb9IVIvcvakXNSyI3y2Y+rfrABII8iKhl5MqPctC4WPivWUlWQkwbDbWRu+
 kp9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677832406;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5poiB9hHsOof3PcUw2itX1s4KSe9/ZAMgLRbkPBocmw=;
 b=ogU2udfs8sy9toIHPaZI+V2K1y7yqt4hRDLQ3POW01XIkoSynod9DY7O+M9uy/lg8S
 29S3jtrRJ+GnM9CEMj2k6BZH2kJBP+VJrC5h6d/jefnxr7Nk3WCiytQu1hwVTzsONCD5
 tkh3tQ3HphZfSR/FgJy61tidlQ/yd8TPChkJANjZqQGMK9lvDcQw4dOgJG08fUKBOe/1
 nr21dZdAJEyNxpOPWjjrYUl7xHkY50cqSKNsO65DBpZqjEpDzdiCntoUAxdzFrjwwnIf
 mwQcy8UWr1gp5J9ngQ2UQDYubmjcW/tABeb2wq7RUmaHghksjhmrTDuRqghGCyoRUW6Y
 bWbQ==
X-Gm-Message-State: AO0yUKUJBqJJqV8Ih0IzSTRqY+SqtFakVE/LeYqR1az9VBCDi4fbyaOD
 pv41rT+MCIKWDitEidQdqYgiDQ==
X-Google-Smtp-Source: AK7set8hlr1yHx+OBqCBQiyW/tJc0LeKAGcAzKgQug0uqmMG1EmbLpBoo1gFuxZYTLA7H9cb7XHBMA==
X-Received: by 2002:a05:6871:207:b0:172:7c37:69b with SMTP id
 t7-20020a056871020700b001727c37069bmr712055oad.5.1677832404958; 
 Fri, 03 Mar 2023 00:33:24 -0800 (PST)
Received: from [192.168.68.107] ([177.189.53.31])
 by smtp.gmail.com with ESMTPSA id
 eg27-20020a056870989b00b001727d67f2dbsm746714oab.40.2023.03.03.00.33.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 00:33:24 -0800 (PST)
Message-ID: <a6b263e9-cc54-e657-8dbb-0c08f5864fe9@ventanamicro.com>
Date: Fri, 3 Mar 2023 05:33:10 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 04/26] gdbstub: clean-up indent on gdb_exit
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Weiwei Li <liweiwei@iscas.ac.cn>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Laurent Vivier <laurent@vivier.eu>, nicolas.eder@lauterbach.com,
 Ilya Leoshkevich <iii@linux.ibm.com>, kvm@vger.kernel.org,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>, Max Filippov
 <jcmvbkbc@gmail.com>, Sunil Muthuswamy <sunilmut@microsoft.com>,
 qemu-s390x@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Marek Vasut <marex@denx.de>,
 Greg Kurz <groug@kaod.org>, Song Gao <gaosong@loongson.cn>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Alistair Francis <alistair.francis@wdc.com>, Chris Wulff
 <crwulff@gmail.com>, qemu-riscv@nongnu.org,
 Michael Rolnik <mrolnik@gmail.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, mads@ynddal.dk,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 John Snow <jsnow@redhat.com>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Yanan Wang <wangyanan55@huawei.com>, David Hildenbrand <david@redhat.com>,
 Taylor Simpson <tsimpson@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20230302190846.2593720-1-alex.bennee@linaro.org>
 <20230302190846.2593720-5-alex.bennee@linaro.org>
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
In-Reply-To: <20230302190846.2593720-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.092,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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



On 3/2/23 16:08, Alex Bennée wrote:
> Otherwise checkpatch will throw a hissy fit on the later patches that
> split this function up.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---

Reviewed-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>

>   gdbstub/gdbstub.c | 28 ++++++++++++++--------------
>   1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/gdbstub/gdbstub.c b/gdbstub/gdbstub.c
> index fb9c49e0fd..63b56f0027 100644
> --- a/gdbstub/gdbstub.c
> +++ b/gdbstub/gdbstub.c
> @@ -3021,27 +3021,27 @@ static void gdb_read_byte(uint8_t ch)
>   /* Tell the remote gdb that the process has exited.  */
>   void gdb_exit(int code)
>   {
> -  char buf[4];
> +    char buf[4];
>   
> -  if (!gdbserver_state.init) {
> -      return;
> -  }
> +    if (!gdbserver_state.init) {
> +        return;
> +    }
>   #ifdef CONFIG_USER_ONLY
> -  if (gdbserver_state.socket_path) {
> -      unlink(gdbserver_state.socket_path);
> -  }
> -  if (gdbserver_state.fd < 0) {
> -      return;
> -  }
> +    if (gdbserver_state.socket_path) {
> +        unlink(gdbserver_state.socket_path);
> +    }
> +    if (gdbserver_state.fd < 0) {
> +        return;
> +    }
>   #endif
>   
> -  trace_gdbstub_op_exiting((uint8_t)code);
> +    trace_gdbstub_op_exiting((uint8_t)code);
>   
> -  snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
> -  put_packet(buf);
> +    snprintf(buf, sizeof(buf), "W%02x", (uint8_t)code);
> +    put_packet(buf);
>   
>   #ifndef CONFIG_USER_ONLY
> -  qemu_chr_fe_deinit(&gdbserver_state.chr, true);
> +    qemu_chr_fe_deinit(&gdbserver_state.chr, true);
>   #endif
>   }
>   

