Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08D744D317
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 09:21:09 +0100 (CET)
Received: from localhost ([::1]:59166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml5KW-00074d-MO
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 03:21:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1ml5IX-0006Ks-1l
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 03:19:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1ml5IV-0003tl-Ih
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 03:19:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636618742;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wQu365jWy+GxPvr4uoQ9V7Tpahp/zHQ0MVcjZj6ayo4=;
 b=Q8cvsRkfmwm6e3zZS9ZvpBMuwdswr4ehStDFzOq+rYQLc9EPhfpCeZmlKAst7Bwp0voHmF
 4JuvjYv/AqLiA7cYRNO3HWG/I0FBWSI40PHaeje24nSeyly7y4KDcSC8uHIVDgpqb9xLVL
 p0mCaLqn/ZBIM9+oCNdKhgV+Mc3eObE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-ZRqdiT0AMWWE0wq2etcRoA-1; Thu, 11 Nov 2021 03:19:01 -0500
X-MC-Unique: ZRqdiT0AMWWE0wq2etcRoA-1
Received: by mail-ed1-f69.google.com with SMTP id
 w26-20020a056402071a00b003e28a389d04so4755127edx.4
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 00:19:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=wQu365jWy+GxPvr4uoQ9V7Tpahp/zHQ0MVcjZj6ayo4=;
 b=wkjsI06l1pmcqjWPYuL6wB7WKfHvy+4kg6qmMc+fRv27d2A7tXym81baac7nQnNsq3
 fghSm9hfK350fQG8CNH6hcrouKv0gG/cW1KxFTgthHeL4+EgiPXnXdRNby1tb0t8gzzl
 T33mZ0omHxvV/CBmdKIqYZnLJ5B0pVLtkHLVE9J4ekg6bntW2Pq/c79uDH7or1yg3uSu
 Y0k7cDyXI+OTsyVO8qt40OEGRH0jagdIBs+ZGSEWEx3lw5/0z3ZLbkP+Z7duQbAGwyn5
 UhwNEQ8akhRtlfDJJTUOMesNRyn+r84nA+jxThI0NJfB4Wdj57euemINlURQggl8FP60
 H/qw==
X-Gm-Message-State: AOAM531aR0BCpn7Vaw9EjLvG5XsWLDOwIoe4AWZaQ5BpZAIVPmorxqYZ
 ezkBg40xKooffcqNVwE27EWDE+kAgFx1Degbngpb6YJJwnHOhMAMNDAub6pfxBlv+WJA/wqrPk8
 /IktLc6LTrIM7tf8=
X-Received: by 2002:a17:907:7210:: with SMTP id
 dr16mr7096963ejc.267.1636618740213; 
 Thu, 11 Nov 2021 00:19:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxrafoBHmteaVjico2uwasq8iIy2iGpJ+IrbH3xHp2LfGY1l0tx9TRSAtSoA2u6b3h0qWL7Uw==
X-Received: by 2002:a17:907:7210:: with SMTP id
 dr16mr7096940ejc.267.1636618739967; 
 Thu, 11 Nov 2021 00:18:59 -0800 (PST)
Received: from gator.home (cst2-173-70.cust.vodafone.cz. [31.30.173.70])
 by smtp.gmail.com with ESMTPSA id j3sm916731ejo.2.2021.11.11.00.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 00:18:59 -0800 (PST)
Date: Thu, 11 Nov 2021 09:18:57 +0100
From: Andrew Jones <drjones@redhat.com>
To: Yanan Wang <wangyanan55@huawei.com>
Subject: Re: [PATCH v2 1/2] tests/unit/test-smp-parse: Make an unified name
 for the tested machine
Message-ID: <20211111081857.e3j7sv4amneaufrv@gator.home>
References: <20211111024429.10568-1-wangyanan55@huawei.com>
 <20211111024429.10568-2-wangyanan55@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20211111024429.10568-2-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: wanghaibin.wang@huawei.com, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 10:44:28AM +0800, Yanan Wang wrote:
> Currently, the name of the tested machine in the expected error
> messages is hardcoded as "(null)" which is not good, because the
> actual generated name of the machine maybe "(null)" or "(NULL)"
> which will cause an unexpected test failure in some CI platforms.
> 
> So let's rename the tested machine with an unified string and
> tweak the expected error messages accordingly.
> 
> Fixes: 9e8e393bb7 ("tests/unit: Add an unit test for smp parsing")
> Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  tests/unit/test-smp-parse.c | 38 ++++++++++++++++++++++++++-----------
>  1 file changed, 27 insertions(+), 11 deletions(-)
> 
> diff --git a/tests/unit/test-smp-parse.c b/tests/unit/test-smp-parse.c
> index cbe0c99049..872512aa37 100644
> --- a/tests/unit/test-smp-parse.c
> +++ b/tests/unit/test-smp-parse.c
> @@ -23,6 +23,8 @@
>  #define MIN_CPUS 1   /* set the min CPUs supported by the machine as 1 */
>  #define MAX_CPUS 512 /* set the max CPUs supported by the machine as 512 */
>  
> +#define SMP_MACHINE_NAME "TEST-SMP"
> +
>  /*
>   * Used to define the generic 3-level CPU topology hierarchy
>   *  -sockets/cores/threads
> @@ -315,13 +317,13 @@ static struct SMPTestData data_generic_invalid[] = {
>           * should tweak the supported min CPUs to 2 for testing */
>          .config = SMP_CONFIG_GENERIC(T, 1, F, 0, F, 0, F, 0, F, 0),
>          .expect_error = "Invalid SMP CPUs 1. The min CPUs supported "
> -                        "by machine '(null)' is 2",
> +                        "by machine '" SMP_MACHINE_NAME "' is 2",
>      }, {
>          /* config: -smp 512
>           * should tweak the supported max CPUs to 511 for testing */
>          .config = SMP_CONFIG_GENERIC(T, 512, F, 0, F, 0, F, 0, F, 0),
>          .expect_error = "Invalid SMP CPUs 512. The max CPUs supported "
> -                        "by machine '(null)' is 511",
> +                        "by machine '" SMP_MACHINE_NAME "' is 511",
>      },
>  };
>  
> @@ -480,26 +482,41 @@ static void unsupported_params_init(MachineClass *mc, SMPTestData *data)
>      }
>  }
>  
> -/* Reset the related machine properties before each sub-test */
> -static void smp_machine_class_init(MachineClass *mc)
> +static Object *smp_test_machine_init(void)
>  {
> +    Object *obj = object_new(TYPE_MACHINE);
> +    MachineClass *mc = MACHINE_GET_CLASS(obj);
> +
> +    g_free(mc->name);
> +    mc->name = g_strdup(SMP_MACHINE_NAME);
> +
>      mc->min_cpus = MIN_CPUS;
>      mc->max_cpus = MAX_CPUS;
>  
>      mc->smp_props.prefer_sockets = true;
>      mc->smp_props.dies_supported = false;
> +
> +    return obj;
> +}
> +
> +static void smp_test_machine_deinit(Object *obj)
> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(obj);
> +
> +    g_free(mc->name);
> +    mc->name = NULL;
> +
> +    object_unref(obj);
>  }
>  
>  static void test_generic(void)
>  {
> -    Object *obj = object_new(TYPE_MACHINE);
> +    Object *obj = smp_test_machine_init();
>      MachineState *ms = MACHINE(obj);
>      MachineClass *mc = MACHINE_GET_CLASS(obj);
>      SMPTestData *data = &(SMPTestData){{ }};
>      int i;
>  
> -    smp_machine_class_init(mc);
> -
>      for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
>          *data = data_generic_valid[i];
>          unsupported_params_init(mc, data);
> @@ -523,19 +540,18 @@ static void test_generic(void)
>          smp_parse_test(ms, data, false);
>      }
>  
> -    object_unref(obj);
> +    smp_test_machine_deinit(obj);
>  }
>  
>  static void test_with_dies(void)
>  {
> -    Object *obj = object_new(TYPE_MACHINE);
> +    Object *obj = smp_test_machine_init();
>      MachineState *ms = MACHINE(obj);
>      MachineClass *mc = MACHINE_GET_CLASS(obj);
>      SMPTestData *data = &(SMPTestData){{ }};
>      unsigned int num_dies = 2;
>      int i;
>  
> -    smp_machine_class_init(mc);
>      mc->smp_props.dies_supported = true;
>  
>      for (i = 0; i < ARRAY_SIZE(data_generic_valid); i++) {
> @@ -575,7 +591,7 @@ static void test_with_dies(void)
>          smp_parse_test(ms, data, false);
>      }
>  
> -    object_unref(obj);
> +    smp_test_machine_deinit(obj);
>  }
>  
>  int main(int argc, char *argv[])
> -- 
> 2.19.1
>

Reviewed-by: Andrew Jones <drjones@redhat.com>


